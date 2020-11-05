using System;
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

        private ArticuloController ArticuloController { get; set; }
        private RecomendacionController RecomendacionController { get; set; }

        public string[] InformacionArticulo { get; private set; }
        public List<string> Autor { get; private set; }

        public string topics { get; private set; }

        public List<string> Topicos { get; private set; }

        public string Autores { get; set; }

        public string UsuarioActual { get; set; }
        public bool haRecomendado { get; set; }
        public void OnGet(String ID)
        {
            idArticulo = ID;
            UsuarioActual = HttpContext.Session.GetString(SessionKeyUsuario);

            ArticuloController = new ArticuloController();
            RecomendacionController = new RecomendacionController();
            Autores = "";
            topics = "";

            if(!String.IsNullOrEmpty(UsuarioActual))
                haRecomendado = RecomendacionController.RetornarHaRecomendado(new string[] {UsuarioActual, idArticulo});

            InformacionArticulo = ArticuloController.RetornarDatos(ID);
            Autor = ArticuloController.RetornarAutor(ID);
            Topicos = ArticuloController.RetornarTopico(ID);

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

        public IActionResult OnPostRecomendarSinUsuario() {
            HttpContext.Session.SetString("PreviousURL", Request.Headers["Referer"].ToString());

            return RedirectToPage("/Cuenta/Ingresar");
        }

        public IActionResult OnPostRecomendar() {
            RecomendacionController = new RecomendacionController();
            UsuarioActual = HttpContext.Session.GetString(SessionKeyUsuario);
            idArticulo = Request.Form["articuloId"];

            String[] recomendacion = {UsuarioActual, idArticulo, Request.Form["titulo"], Request.Form["comentario"] };

            RecomendacionController.RecomendarArticulo(recomendacion);

            return Redirect(Request.Headers["Referer"].ToString());
        }
    }
}