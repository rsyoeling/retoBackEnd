package com.edu.pe.controllers;

import com.edu.pe.models.Actividad;
import com.edu.pe.models.Cliente;
import com.edu.pe.models.Operador;
import com.edu.pe.repository.ActividadRepository;
import com.edu.pe.repository.OperadorRepository;
import com.edu.pe.service.IActividadService;
import com.edu.pe.service.IClienteService;
import java.util.List;
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
@RequestMapping("api/actividad")
public class ActividadController {

    @Autowired
    private IActividadService service;

    @GetMapping("/listar")
    public ResponseEntity<List<Actividad>> ListarTodos() {
        List<Actividad> lista = service.ListarTodos();
        return new ResponseEntity<>(lista, HttpStatus.OK);
    }

    @PostMapping("/registrar")
    public ResponseEntity<?> Registrar(@RequestBody Actividad a) {
        boolean status = service.Registrar(a);

        if (status) {
            return new ResponseEntity<>(a, HttpStatus.OK);
        } else {
            String mensaje = "No se ha registrado actividad";
            return new ResponseEntity<>(mensaje, HttpStatus.BAD_REQUEST);
        }
    }
}
