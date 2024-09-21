const assert = require("assert");
const { Given, When, Then, setDefaultTimeout } = require("@cucumber/cucumber");
const axios = require("axios");
const { equal } = require("assert");

// -------Los uso para generateFormData --------------
const FormData = require('form-data');
const fs = require('fs/promises');

class WhatsappUser {
  constructor(usrPhoneNumber) {
    this.primaryPhoneNumber = usrPhoneNumber;
    this.profile = null;
    this.lastRequestedData = null;
    this.updateUserData();
  }

  hasAProfile = async () => {
    if (!this.lastRequestedData) {
      await this.updateUserData(this.primaryPhoneNumber);
    }
    return this.lastRequestedData.Profile ? true : false;
  };

  updateUserData = async () => {
    const res = await axios
      .get(
        `https://s01.ysocial.net/test/services/agents/searchwhatsappuser?number=${this.primaryPhoneNumber}`,
        { headers: headers }
      )
      .then((res) => {
        assert.strictEqual(res.status,200)
        return res;
      })
      .catch((error) => {
        console.log(error);
        throw new Error("Failed response in updateUserData");
      });

    this.lastRequestedData = res.data.Result;
    this.profile = res.data.Result.Profile;
    return res.data.Result;
  };

  setBusinessData = async (dataToBeSet) => {
    await updateBusinessData(this.profile, dataToBeSet);
    await this.updateUserData();
    assert.strictEqual(this.profile.BusinessData, dataToBeSet);
  };

  getLastCaseMessages = async () => {
    return await getLastCaseMessages(this.profile.ID);
  }
}

const headers = {
  Authorization:
    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3UiOjE2NTQ3MjI3ODcsImVpIjo1fQ.ypZhu2kzC3VdGawwiOz1zZtgx9T6wQzbuxA5imA1ENs",
};

const updateBusinessData = async (
  { ID, Name, PrimaryEmail, PrimaryPhoneNumber, Parameters },
  newBusinessData
) => {
  const body = {
    socialUserProfileId: ID,
    name: Name,
    primaryEmail: PrimaryEmail,
    primaryPhoneNumber: PrimaryPhoneNumber,
    businessData: newBusinessData,
    extendedProfileFields: JSON.parse(Parameters.Ext),
    id: 317,
  };

  const postResponse = await axios
    .post(`https://s01.ysocial.net/Test/services/agents/updateprofile`, body, {
      headers: headers,
    })
    .then((res) => {
      assert.strictEqual(res.status,200)
      return res.data;
    })
    .catch((error) => {
      console.log(error);
    });
};

class hsmTask {
  constructor(templateType){
    this.mediaId = null,
    this.taskName = "peperino", //randomizar despues
    this.taskId = null,
    this.taskTemplateName = null,
    this.csv = null
    this.templateType = templateType

  }

  initAppendingTaskMedia = async () => {
    const res = await initAppendingTaskMedia()
    this.mediaId = res.data.Result.media_id
  }

  appendTaskMedia = async () => {
    const res = await appendTaskMedia(this.mediaId,await this.csv.getFile())
  }

  finishAppendingTaskMedia = async () => {
    const response = await finishAppendingTaskMedia(this.mediaId)
  }

  scheduleTaskOnYsocial = async () => {
    const response = await scheduleTask(this.mediaId,this.buildScheduleTaskBody())
    if(response.data.Success){
      this.saveTaskId(response)
      console.log(`Nueva tarea cargada: ${this.taskId}`)
    }
  }

  postTaskOnYsocial = async () => {
    await this.initAppendingTaskMedia()
    await this.appendTaskMedia()
    await this.finishAppendingTaskMedia()
  }
  
  buildScheduleTaskBody = () => {
    return {
      "serviceId": 68,
      "mediaId": `${this.mediaId}`,
      "taskName": "peperino", //ahora esta hardcodeado como peperino
      "hsmElementName": "saludo_de_bienvenida", //hardcodeado como saludo de bienvenida
      "hsmNamespace": "d968a4b2_8420_4c8a_92cc_d72bd351153c",
      "scheduleDateTime": null,
      "sendhsmIfCaseOpenAnyways":true,
      "businessData": true,
      // "extendedCaseParam":true
    }
  }

  buildBaseCsv = () => {
    this.csv = new hsmMasiveCsv(this.chooseTemplate())
    return null
  }
  
  chooseTemplate = () =>{
    const templateToBeUsed = {}
    //en base a el tipo de template que va a utilizar la tarea, devolver un template de ejemplo 
    this.taskTemplateName = "saludo_de_bienvenida"//templateToBeUsed
    return templateToBeUsed
  }

  saveTaskId = (axiosResponse) => {
    this.taskId = axiosResponse.data.Result.ID
  }
}

class hsmMasiveCsv{
  constructor(templateToBeUsed){
    this.body = [],
    this.file = null
    this.referenceTemplate = templateToBeUsed
  }
  appendRowWithBusinessData = (usrPhone,action,payload="") => {
    this.body = [...this.body, [usrPhone,this.getTemplateCustomParameters(),action,payload]]
  }
  getTemplateCustomParameters = (nombreTemplate) => {
    //pendiente: evaluar el tipo de template y generar la cantidad de parametros necesarios para la plantilla a usar
    return null
  }
  getFile = async () =>{
    //pendiente: return construccion de archivo a partir de this.body
    return await fs.readFile("./assets/43631.csv");
  }
  setFile = async () => {
    this.file = await this.getFile()
  }
  
}

const initAppendingTaskMedia = async () => {
  return res = await axios
      .post(
        `https://s01.ysocial.net/test/services/media/upload?command=INIT&total_bytes=54&media_type=text/csv&media_category=csv`,{},
        { headers: {
          "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3UiOjE2NTQ3MjI3ODcsImVpIjo1fQ.ypZhu2kzC3VdGawwiOz1zZtgx9T6wQzbuxA5imA1ENs",
          "Content-Length": "0"      
        }}
      )
      .then((res) => {
        assert.strictEqual(res.status,200)
        return res;
      })
      .catch((error) => {
        console.log("error en initTaskMedia")
        console.log(error);
      });
}


const appendTaskMedia = async (mediaId,csvFile) => {
  return res = await axios
    .post(
      `https://s01.ysocial.net/test/services/media/upload?command=APPEND&media_id=${mediaId}&segment_index=0`, generateFormData(csvFile),
      {headers: {
        "Content-Type":"multipart/form-data",
        "content-type":"multipart/form-data",
        "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3UiOjE2NTQ3MjI3ODcsImVpIjo1fQ.ypZhu2kzC3VdGawwiOz1zZtgx9T6wQzbuxA5imA1ENs"
      }}
    )
    .then((res)=>{
      assert.strictEqual(res.status,200)
      return res;
    })
    .catch((error)=>{
      throw new Error("Failed response in appendtaskMedia")
    })
}

const generateFormData = (file) => {
  const form = new FormData();
  form.append("media", file, "archivito.csv");
  return form;
}

const finishAppendingTaskMedia = async (mediaId) => {
  return res = await axios
  .post(
    `https://s01.ysocial.net/test/services/media/upload?command=FINALIZE&media_id=${mediaId}`, {},
    {headers: {
      "Authorization":
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3UiOjE2NTQ3MjI3ODcsImVpIjo1fQ.ypZhu2kzC3VdGawwiOz1zZtgx9T6wQzbuxA5imA1ENs"
    }}
  )
  .then((res)=>{
    assert.strictEqual(res.status,200)
    return res;
  })
  .catch((error)=>{
    console.log("error en req finishAppendingTaskMedia")
    console.log(error)
  })
}

const scheduleTask = async (mediaId,requestBody) => {
  return res = await axios
    .post(
      `https://s01.ysocial.net/test/services/tasks/whatsapphsm`, requestBody,
      {headers: {
        "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3UiOjE2NTQ3MjI3ODcsImVpIjo1fQ.ypZhu2kzC3VdGawwiOz1zZtgx9T6wQzbuxA5imA1ENs"
      }}
    )
    .then((res)=>{
      assert.strictEqual(res.status,200)
      switch (res.data.Success){
        case true:
          return res;
        case false:
          throw new Error("request had a failed success")
      }

    })
    .catch((error)=>{
      console.log(error)
      throw new Error("failed response in schedule task")
    })
}

function later(delay) {
  return new Promise(function(resolve) {
      setTimeout(resolve, delay);
  });
}

const getLastCaseMessages = async (userProfileId) => {
  
  return messages = await axios.get(`https://s01.ysocial.net/Test/services/cases/retrieve?socialUserProfileId=${userProfileId}`,
  {headers:headers})
  .then((res)=> {
    assert.strictEqual(res.status,200)
    return res.data.Result.Case.Messages
  })
  .catch((error)=>{
    console.log(error)
    throw new Error("failed response in getLastCaseMessages")
  })
}


// ----------------- Lo Gherkin ------------------------
Given(
  'el usuario con el tel {int} que posee los siguientes datos de negocio "{string}"', {timeout: 60 * 1000 }, 
  async function (usrPhoneNumber, initialBusinessData) {
    this.whatsappUser = new WhatsappUser(usrPhoneNumber);
    if (await this.whatsappUser.hasAProfile()) {
      await this.whatsappUser.setBusinessData(initialBusinessData)
      
    } else {
      console.log("The whatsapp user doesnt have a profile to be edited");
    }
    assert.strictEqual(this.whatsappUser.profile.BusinessData,initialBusinessData)
  }
);
Given(
  'que este tel esta en un registro de un csv con parametros configurados para una plantilla con "{string}"',
  function (compositionTemplate) {
    this.task = new hsmTask(compositionTemplate);
    this.task.buildBaseCsv()
  }
);
// Given(
//   'dado un csv con su registro para una plantilla que contiene "{string}"',
//   function (composicionDeTemplate) {
//     this.task = new hsmTask(composicionDeTemplate);
//     this.task.buildBaseCsv()
//   }
// );

Given(
  'dado que en el registro luego de los parámetros de la plantilla posee el parametro "{string}"',
  async function (action) {
    this.task.csv.appendRowWithBusinessData(this.whatsappUser.primaryPhoneNumber,action,payload)
  }
);

Given(
  'dado que en el registro luego de los parámetros de la plantilla posee el parametro "{string}" y "{string}"',
  async function (action, payload) {
    this.task.csv.appendRowWithBusinessData(this.whatsappUser.primaryPhoneNumber,action,payload)
  }
);

When("se envía la tarea masiva HSM",{timeout: 600 * 1000 }, async function () {
  await this.task.postTaskOnYsocial()
  await this.task.scheduleTaskOnYsocial()

});

Then("el usuario recibe el HSM", {timeout: 1200 * 1000 }, async function () {
  while (true) {
     const messages = await this.whatsappUser.getLastCaseMessages()
     console.log("consegui una lista de mensajes")
     if (messages == null || messages == undefined) {
      console.log("salto por null o undefined")
      continue
     } 
     const searchResult = messages.find((message)=>{
         if(message.Parameters.hasOwnProperty('CampaignId')){
          if(message.Parameters.CampaignId == this.task.taskId){
            return true
          }
        }
      })
      if(searchResult) {
        break
      }
    await later(10000)
    // break
  }
});

Then(
  'sus datos de negocio son los siguientes "{string}"',
  async function (expectedBusinessData) {
    if (expectedBusinessData == "") {
      expectedBusinessData = null
    }
    await this.whatsappUser.updateUserData();
    assert.strictEqual(
      await this.whatsappUser.lastRequestedData.BusinessData,
      expectedBusinessData
    );
  }
);

const hasMessageThisProperty = (message,property,expectedValue) => {
  if(message.Parameters.hasOwnProperty(property)){
    if(message.Parameters[property] == expectedValue){
      return true
    }
  }
}