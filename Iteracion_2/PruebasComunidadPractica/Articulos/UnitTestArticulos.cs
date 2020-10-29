using Microsoft.VisualStudio.TestTools.UnitTesting;
using Iteracion_2.Models;
using Iteracion_2.Controllers;
using System.Collections.Generic;
using Castle.Core.Internal;

namespace PruebasComunidadPractica.Articulos
{
    [TestClass]
    public class UnitTestArticulos
    {

        [TestMethod]
        public void ValidarRetornoArticulos()
        {
            ArticuloModel articuloModel;
            articuloModel = new ArticuloModel();
            List < List<string> > articulos = articuloModel.validarRetornoArticulos();

            Assert.IsFalse  (articulos.IsNullOrEmpty(), "No se retornaron artículos");
        }
    }
}
