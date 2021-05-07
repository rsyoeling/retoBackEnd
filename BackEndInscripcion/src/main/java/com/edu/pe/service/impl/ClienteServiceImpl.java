package com.edu.pe.service.impl;

import com.edu.pe.models.Cliente;
import com.edu.pe.repository.ClienteRepository;
import com.edu.pe.service.IClienteService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClienteServiceImpl implements IClienteService {

    @Autowired
    private ClienteRepository repositorio;

    @Override
    public List<Cliente> ListarTodos() {
        return repositorio.findAll();
    }

    @Override
    public boolean Registrar(Cliente c) {

        try {
            repositorio.save(c);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

}
