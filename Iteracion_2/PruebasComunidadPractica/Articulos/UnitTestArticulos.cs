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

        [TestMethod]
        public void ValidarRetornoInformacionArticulo()
        {
            ArticuloModel articuloModel;
            articuloModel = new ArticuloModel();
            string ID = "";
            List<List<string>> articulos = articuloModel.validarRetornoArticulos();
            if (!articulos.IsNullOrEmpty())
            {
                ID = articulos[0][0];
            }
            else
            {
                Assert.Fail();
            }
            string [] InformacionArticulo = articuloModel.RetornarDatos(ID);

            Assert.IsFalse(InformacionArticulo.IsNullOrEmpty(), "No se retornaron detalles del artículo");
        }
        [TestMethod]
        public void ValidarRetornoAutorArticulo()
        {
            ArticuloModel articuloModel;
            articuloModel = new ArticuloModel();
            string ID = "";
            List<List<string>> articulos = articuloModel.validarRetornoArticulos();
            if (!articulos.IsNullOrEmpty())
            {
                ID = articulos[0][0];
            }
            else
            {
                Assert.Fail();
            }
            List<string> autores = articuloModel.RetornarAutor(ID);

            Assert.IsFalse(autores.IsNullOrEmpty(), "No se retornaron autores del artículo");
        }
        [TestMethod]
        public void ValidarRetornoTopicosArticulo()
        {
            ArticuloModel articuloModel;
            articuloModel = new ArticuloModel();
            string ID = "";
            List<List<string>> articulos = articuloModel.validarRetornoArticulos();
            if (!articulos.IsNullOrEmpty())
            {
                ID = articulos[0][0];
            }
            else
            {
                Assert.Fail();
            }
            List<string> topicos = articuloModel.RetornarTopicos(ID);

            Assert.IsFalse(topicos.IsNullOrEmpty(), "No se retornaron tópicos del artículo");
        }
    }
}
