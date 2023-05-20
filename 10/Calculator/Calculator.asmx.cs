using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml.Linq;
using System.Xml.Serialization;

namespace Calculator {
    /// <summary>
    /// Summary description for Calculator
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Calculator : System.Web.Services.WebService {
        
        [WebMethod]
        public string HelloWorld() {
            return "Hello World";
        }

        public enum ArithmeticOperation : ushort {
            Addition = '+',
            Subtraction = '-',
            Multiplication = '*',
            Division = '/'
        }
        
        [WebMethod]
        public string GetOperation(double num1, double num2, char arithOper) {
            switch ((ArithmeticOperation)arithOper) {
                case ArithmeticOperation.Addition:
                    return $"{num1 + num2}";
                case ArithmeticOperation.Subtraction:
                    return $"{num1 - num2}";
                case ArithmeticOperation.Multiplication:
                    return $"{num1 * num2}";
                case ArithmeticOperation.Division:
                    return num2 == 0 ? "Error: Division by ZERO" : $"{num1 / num2}";
                default:
                    return "Error";
            }
        }

        [WebMethod]
        public string Addition(double num1, double num2) => $"{num1 + num2}";

        [WebMethod]
        public string Subtraction(double num1, double num2) => $"{num1 - num2}";
        
        [WebMethod]
        public string Multiplication(double num1, double num2) => $"{num1 * num2}";

        [WebMethod]
        public string Division(double num1, double num2) => num2 == 0? "Error: Division by ZERO" : $"{num1 / num2}";
        
    }
}