package com.edu.pe.service;

import com.edu.pe.models.Cliente;
import java.util.List;

public interface IClienteService {

    public List<Cliente> ListarTodos();

    public boolean Registrar(Cliente c);
}
