using OpenQA.Selenium;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace yTestFramework.Extensions
{
    public static class HtmlTableExtension
    {

        //Read of Table

        private static List<TableDataCollection> ReadTable(IWebElement table)
        {
            //Init the table
            var tableDataCollection = new List<TableDataCollection>();

            //Get all the columns from the table
            Thread.Sleep(1000);
            var columns = table.FindElements(By.TagName("th"));

            //Get all the rows
            var rows = table.FindElements(By.XPath("./tbody/tr"));

            //Create row index
            int rowIndex = 0;
            foreach (IWebElement row in rows)
            {
                int colIndex = 0;
                var colDatas = row.FindElements(By.XPath("./td"));
                //Store data only if it has value in row
                if (colDatas.Count != 0)
                    foreach (var colValue in colDatas)
                    {
                        tableDataCollection.Add(new TableDataCollection
                        {
                            RowNumber = rowIndex,
                            ColumnNumber = colIndex,
                            ColumnName = columns[colIndex].Text != "" ?
                                         columns[colIndex].Text : colIndex.ToString(),
                            ColumnValue = colValue.Text,
                            ColumnSpecialValues = GetControl(colValue)
                        });

                        //Move to next column
                        colIndex++;
                    }
                rowIndex++;

            }

            return tableDataCollection;
        }

        private static List<TableDataCollection> ReadFirstRowOfTable(IWebElement table)
        {
            // Initialize the table
            var tableDataCollection = new List<TableDataCollection>();

            // Get all the columns from the table
            Thread.Sleep(1000);
            var columns = table.FindElements(By.TagName("th"));

            // Get the first row
            var firstRow = table.FindElement(By.XPath("./tbody/tr[1]"));

            int colIndex = 0;
            var colDatas = firstRow.FindElements(By.XPath("./td"));

            foreach (var colValue in colDatas)
            {
                tableDataCollection.Add(new TableDataCollection
                {
                    RowNumber = 0,  // Assuming it's the first row
                    ColumnNumber = colIndex,
                    ColumnName = columns[colIndex].Text != "" ?
                                 columns[colIndex].Text : colIndex.ToString(),
                    ColumnValue = colValue.Text,
                    ColumnSpecialValues = GetControl(colValue)
                });

                // Move to the next column
                colIndex++;
            }

            return tableDataCollection;
        }

        private static ColumnSpecialValue GetControl(IWebElement columnValue)
        {
            ColumnSpecialValue? columnSpecialValue = null;

            if (columnValue.FindElements(By.XPath(".//a")).Count > 0)
            {
                columnSpecialValue = new ColumnSpecialValue
                {
                    ElementCollection = columnValue.FindElements(By.XPath(".//a")),
                    ControlType = ControlType.hyperlink
                };
            }

            if (columnValue.FindElements(By.XPath(".//input")).Count > 0)
            {
                columnSpecialValue = new ColumnSpecialValue
                {
                    ElementCollection = columnValue.FindElements(By.XPath(".//input")),
                    ControlType = ControlType.input
                };
            }

            return columnSpecialValue;
        }

        public static void PerformActionOnCell(this IWebElement element, int targetColumnIndex, string refColumnName, string refColumnValue, int controlToOperate)
        {
            //targetColumnIndex es la columna a operar
            //refColumnName columna en la cual identificar el valor para decidir a que fila focusear
            //refColumnValue valor que se espera encontrar en refColumnName
            //controlToOperate elemento a clickear en un array de elementos

            //First read the table

            List<TableDataCollection> table = ReadTable(element);

            ColumnSpecialValue? cell = null;

            int? refRow = null;

            //Iterate in the table and get the type of cell you are looking for
            refRow = (from e in table
                      where e.ColumnName == refColumnName && e.ColumnValue.Contains(refColumnValue)
                      select e.RowNumber).SingleOrDefault();
            if (refRow != null)
            {
                cell = (from e in table
                        where e.RowNumber == refRow && e.ColumnNumber == targetColumnIndex
                        select e.ColumnSpecialValues).SingleOrDefault();
            }

            if (cell != null && cell.ElementCollection != null && cell.ElementCollection.Any())
            {
                IWebElement control = cell.ElementCollection.ElementAt(controlToOperate);
                control.Click();
            }

        }

        public static void PerformActionOnCellOnFirstRow(this IWebElement table, int targetColumnIndex, int controlToOperate)
        {
            // First, read the table data
            List<TableDataCollection> tableData = ReadFirstRowOfTable(table);



            // Check if there is at least one row in the table
            if (tableData.Count > 0)
            {
                ColumnSpecialValue? cell = tableData[targetColumnIndex].ColumnSpecialValues;

                if (cell != null && cell.ElementCollection != null && cell.ElementCollection.Any())
                {
                    IWebElement control = cell.ElementCollection.ElementAt(controlToOperate);
                    control.Click();
                }
                else
                {
                    Console.WriteLine("The first row doesn't have any ColumnSpecialValues.");
                }
            }
            else
            {
                Console.WriteLine("The table is empty.");
            }
        }

        public class TableDataCollection
        {

            public int RowNumber { get; set; }

            public int ColumnNumber { get; set; }

            public string? ColumnName { get; set; }

            public string? ColumnValue { get; set; }

            public ColumnSpecialValue? ColumnSpecialValues { get; set; }

        }

        public class ColumnSpecialValue
        {
            public IEnumerable<IWebElement>? ElementCollection { get; set; }

            public ControlType? ControlType { get; set; }

        }

        public enum ControlType
        {
            hyperlink,
            input,
            option,
            select
        }
    }
}