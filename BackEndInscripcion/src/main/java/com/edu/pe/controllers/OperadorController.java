package com.edu.pe.controllers;

import com.edu.pe.models.Operador;
import com.edu.pe.service.IOperadorService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping("api/operador")
public class OperadorController {

    @Autowired
    private IOperadorService service;

    @PostMapping(value = "/registrar")
    public ResponseEntity<?> Registrar(@RequestBody Operador op) {
        try {
            Map<String, Object> msj = service.RegistrarOperador(op);
            return new ResponseEntity<>(msj, HttpStatus.OK);
        } catch (Exception ex) {
            return new ResponseEntity<>("Datos erroneos", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/listar")
    public ResponseEntity<List<Operador>> ListarTodos() {
        List<Operador> lista = service.ListarTodos();
        return new ResponseEntity<>(lista, HttpStatus.OK);
    }
}
