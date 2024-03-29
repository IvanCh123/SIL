﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iteracion_2.Controllers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;


namespace Iteracion_2.Pages.Cuenta
{
    public class IngresarModel : PageModel
    {
        const string SessionKeyURL = "PreviousURL";
        private MiembroController MiembroController { set; get; }

        public void OnGet(string Mensaje)
        {
            if (Mensaje != null) {
                ViewData["alerta"] = Mensaje;
            }
        }

        public IActionResult OnPost()
        {
            MiembroController = new MiembroController();
            string nombreUsuario = Request.Form["nombreUsuario"];
            string contrasenia = Request.Form["contrasenia"];

            if (nombreUsuario.Equals(""))
            {
                ViewData["alerta"] = "No digito un nombre usuario";
                return Page();
            }

            if (!MiembroController.IngresarCuenta(nombreUsuario))
            {
                ViewData["alerta"] = "Usuario incorrecto.";
                return Page();
            }else
            {
                HttpContext.Session.SetString("UsuarioActual", nombreUsuario);

                var valoresMiembro = MiembroController.RetornarPesoMiembroTipo(nombreUsuario);
                string pesoMiembro = valoresMiembro.Item1;
                string tipo = valoresMiembro.Item2;
                HttpContext.Session.SetString("PesoActual", pesoMiembro);
                HttpContext.Session.SetString("TipoActual", tipo);

                String PreviousURL = HttpContext.Session.GetString(SessionKeyURL);

                return Redirect(PreviousURL ?? "/Perfil/Perfil");
            }
        }

        public void OnPostCrear()
        {
            Response.Redirect("Registrar");
        }
    }
}