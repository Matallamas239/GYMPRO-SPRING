package com.example.demo.usuarios;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    // ============= LISTAR + FORMULARIO VACÍO =============
    @GetMapping("/list")
    public String listarUsuarios(Model model) {

        model.addAttribute("usuarios", usuarioService.listarUsuarios());

        // Usuario vacío para el formulario de registro
        model.addAttribute("usuario", new Usuario());

        return "usuarios/usuarios"; // TU JSP
    }

    // ============= GUARDAR NUEVO USUARIO =============
    @PostMapping("/save")
    public String guardarUsuario(@ModelAttribute Usuario usuario) {

        usuarioService.crearUsuario(usuario);

        return "redirect:/usuarios/list";
    }


    // ============= CARGAR USUARIO PARA EDITAR =============
    @GetMapping("/edit/{id}")
    public String cargarParaEditar(@PathVariable int id, Model model) {

        model.addAttribute("usuarios", usuarioService.listarUsuarios());
        model.addAttribute("usuario", usuarioService.obtenerUsuarioPorId(id));

        return "usuarios/usuarios";  // Misma vista
    }


    // ============= ACTUALIZAR USUARIO =============
    @PostMapping("/update")
    public String actualizarUsuario(@ModelAttribute Usuario usuario) {

        usuarioService.actualizarUsuario(usuario);

        return "redirect:/usuarios/list";
    }


    // ============= ACTIVAR / DESACTIVAR (SOFT DELETE) =============
    @GetMapping("/toggle/{id}")
    public String cambiarEstado(@PathVariable int id) {

        Usuario u = usuarioService.obtenerUsuarioPorId(id);

        usuarioService.cambiarEstado(id, !u.isActivo());

        return "redirect:/usuarios/list";
    }

}
