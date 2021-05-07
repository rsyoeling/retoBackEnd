package com.edu.pe.controllers;

import com.edu.pe.models.Cliente;
import com.edu.pe.service.IClienteService;
import java.util.HashMap;
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
@RequestMapping("api/cliente")
public class ClienteController {

    @Autowired
    private IClienteService service;

    @GetMapping("/listar")
    public ResponseEntity<List<Cliente>> ListarTodos() {
        List<Cliente> lista = service.ListarTodos();
        return new ResponseEntity<>(lista, HttpStatus.OK);
    }

    @PostMapping("/registrar")
    public ResponseEntity<?> Registrar(@RequestBody Cliente c) {
        Map<String, Object> data = new HashMap<>();

        boolean status = service.Registrar(c);

        try {
            if (status) {
                data.put("codigoError", "000");
                data.put("descripcion", "Solicitud procesada satisfactoriamente");
                return new ResponseEntity<>(data, HttpStatus.OK);
            } else {
                data.put("codigoError", "002");
                data.put("descripcion", "Estimado, los datos proporcionados son incorrectos.");
                return new ResponseEntity<>(data, HttpStatus.ACCEPTED);
            }

        } catch (Exception ex) {
            data.put("codigoError", "001");
            data.put("descripcion", "Estimado, su solicitud no pudo ser procesada.");
            return new ResponseEntity<>(data, HttpStatus.BAD_REQUEST);
        }
    }
}
