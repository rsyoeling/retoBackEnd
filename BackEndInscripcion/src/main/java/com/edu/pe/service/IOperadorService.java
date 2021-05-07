package com.edu.pe.service;

import com.edu.pe.models.Operador;
import java.util.List;
import java.util.Map;

public interface IOperadorService {

    public List<Operador> ListarTodos();
    
    public Map<String, Object> RegistrarOperador(Operador op);
}
