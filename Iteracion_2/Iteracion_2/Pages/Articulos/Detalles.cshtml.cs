﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iteracion_2.Controllers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Iteracion_2.Pages.Articulos
{
    public class Detalles : PageModel
    {
        const string SessionKeyUsuario = "UsuarioActual";
        public String idArticulo { set; get; }

        ArticuloController ArticuloContro { get; set; }

        public string[] InformacionArticulo { get; private set; }
        public List<string> Autor { get; private set; }

        public string topics { get; private set; }

        public List<string> Topicos { get; private set; }

        public string Autores { get; set; }

        public string UsuarioActual { get; set; }
        public void OnGet(String ID)
        {
            idArticulo = ID;
            UsuarioActual = HttpContext.Session.GetString(SessionKeyUsuario);

            ArticuloContro = new ArticuloController();
            Autores = "";
            topics = "";
            InformacionArticulo = ArticuloContro.RetornarDatos(ID);
            Autor = ArticuloContro.RetornarAutor(ID);
            Topicos = ArticuloContro.RetornarTopico(ID);
            for (int index = 0; index < Autor.Count; index++)
            {
                if (index != 0)
                {
                    Autores += " , ";
                }
                Autores += Autor[index] + " ";
            }
            for (int index = 0; index < Topicos.Count; index++)
            {
                if (index != 0)
                {
                    topics += " , ";
                }
                topics += Topicos[index] + " ";
            }
        }

        public IActionResult OnPostRecomendarVacio() {
            HttpContext.Session.SetString("PreviousURL", Request.Headers["Referer"].ToString());

            return RedirectToPage("/Cuenta/Ingresar");
        }
    }
}