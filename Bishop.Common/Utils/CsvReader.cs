using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Common.Utils
{
    public class CsvReader
    {
        public static List<int> ReadIdsFromCsv(string filePath)
        {
            // Lee todas las líneas del archivo CSV
            var lines = File.ReadAllLines(filePath);

            // Salta la primera línea si contiene encabezados
            return lines.Skip(1)
                        .Select(line => line.Split(',')[0]) // Selecciona la columna de ID
                        .Where(id => int.TryParse(id, out _)) // Filtra solo los IDs válidos
                        .Select(int.Parse) // Convierte cada ID a entero
                        .ToList();
        }
        public static List<Dictionary<string, string>> ReadAgentsCredentialsFromCsv(string filePath)
        {
            var agentsData = new List<Dictionary<string, string>>();

            // Lee todas las líneas del archivo
            var lines = File.ReadAllLines(filePath);

            // Asegúrate de que el archivo tenga al menos una línea de encabezado y otra de datos
            if (lines.Length < 2) return agentsData;

            // La primera línea contiene los encabezados
            var headers = lines[0].Split(',');

            // Procesa cada línea de datos, comenzando desde la segunda
            foreach (var line in lines.Skip(1))
            {
                var values = line.Split(',');
                var agentData = new Dictionary<string, string>();

                for (int i = 0; i < headers.Length; i++)
                {
                    // Añade el par clave-valor para cada columna
                    agentData[headers[i]] = values[i];
                }

                agentsData.Add(agentData);
            }

            return agentsData;
        }

        [Test]
        public static void AgentsShouldBeLoadedWithCSVWithCredentials()
        {
            List<Dictionary<string,string>> agentList = ReadAgentsCredentialsFromCsv(@"C:\Users\Santiago\Downloads\agentsCSV.csv");
        }

    }
}
