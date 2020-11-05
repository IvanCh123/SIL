using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Iteracion_2.Models;
using Iteracion_2.Controllers;
using Castle.Core.Internal;

namespace PruebasComunidadPractica.Articulos
{
    [TestClass]
    public class UnitTestRecomendacion
    {
        [TestMethod]
        public void ValidarRecomendarArticulo()
        {
            RecomendacionModel recomendacionModel;
            recomendacionModel = new RecomendacionModel();
            String[] recomendacion = { "Dasc12", "3", "Mi recomendacion", "Me gusta este articulo" };
            String[] datos = { "Dasc12", "3" };

            if(recomendacionModel.RetornarHaRecomendado(datos) == false)
            {
                recomendacionModel.RecomendarArticulo(recomendacion);
                Assert.IsTrue(recomendacionModel.RetornarHaRecomendado(datos), "No se realizo al recomendacion");
            }
            else
            {
                Assert.IsTrue(recomendacionModel.RetornarHaRecomendado(datos), "No se realizo al recomendacion");
            }
        }
    }
}
