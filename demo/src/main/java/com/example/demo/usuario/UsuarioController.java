package com.example.demo.usuario;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    /* ================= MIEMBROS ================ */

    @GetMapping("/miembros/list")
    public String listarMiembros(Model model) {
        model.addAttribute("miembros", usuarioService.listarMiembros());
        return "usuario/miembros_list";
    }

    @GetMapping("/miembros/nuevo")
    public String nuevoMiembro(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "usuario/miembros_form";
    }

    @PostMapping("/miembros/guardar")
    public String guardarMiembro(@ModelAttribute("usuario") Usuario usuario) {
        usuario.setRol("cliente");
        usuario.setActivo(true);
        usuarioService.crearUsuario(usuario);
        return "redirect:/usuario/miembros/list";
    }

    @GetMapping("/miembros/editar/{id}")
    public String editarMiembro(@PathVariable Integer id, Model model) {
        model.addAttribute("usuario", usuarioService.buscarPorId(id));
        return "usuario/miembros_form";
    }

    @PostMapping("/miembros/actualizar")
    public String actualizarMiembro(@ModelAttribute("usuario") Usuario usuario) {
        usuario.setRol("cliente");
        usuarioService.actualizarUsuario(usuario);
        return "redirect:/usuario/miembros/list";
    }

    @PostMapping("/miembros/cambiar-estado")
    public String cambiarEstadoMiembro(@RequestParam Integer id, @RequestParam boolean activo) {
        usuarioService.cambiarEstadoUsuario(id, activo);
        return "redirect:/usuario/miembros/list";
    }

    /* ================= PERSONAL ================ */

    @GetMapping("/personal/list")
    public String listarPersonal(Model model) {
        model.addAttribute("personal", usuarioService.listarPersonal());
        return "usuario/personal_list";
    }

    @GetMapping("/personal/nuevo")
    public String nuevoPersonal(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "usuario/personal_form";
    }

    @PostMapping("/personal/guardar")
    public String guardarPersonal(@ModelAttribute("usuario") Usuario usuario) {
        usuario.setRol("personal");
        usuario.setActivo(true);
        usuarioService.crearUsuario(usuario);
        return "redirect:/usuario/personal/list";
    }

    @GetMapping("/personal/editar/{id}")
    public String editarPersonal(@PathVariable Integer id, Model model) {
        model.addAttribute("usuario", usuarioService.buscarPorId(id));
        return "usuario/personal_form";
    }

    @PostMapping("/personal/actualizar")
    public String actualizarPersonal(@ModelAttribute("usuario") Usuario usuario) {
        usuario.setRol("personal");
        usuarioService.actualizarUsuario(usuario);
        return "redirect:/usuario/personal/list";
    }

    @PostMapping("/personal/cambiar-estado")
    public String cambiarEstadoPersonal(@RequestParam Integer id, @RequestParam boolean activo) {
        usuarioService.cambiarEstadoUsuario(id, activo);
        return "redirect:/usuario/personal/list";
    }

    /* ============ Registro público de clientes =============== */

    @GetMapping("/registro")
    public String mostrarRegistroCliente(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "public/registro_cliente";
    }

    @PostMapping("/registro")
    public String registrarCliente(@ModelAttribute("usuario") Usuario usuario) {
        usuarioService.registrarCliente(usuario);
        return "redirect:/login";
    }
}
