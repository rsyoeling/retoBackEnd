package com.edu.pe.service.impl;

import com.edu.pe.models.Operador;
import com.edu.pe.service.IOperadorService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.edu.pe.repository.OperadorRepository;
import java.util.Map;

@Service
public class OperadorServiceImpl implements IOperadorService {

    @Autowired
    private OperadorRepository repositorio;

    @Override
    public List<Operador> ListarTodos() {
        return repositorio.findAll();
    }

    @Override
    public Map<String, Object> RegistrarOperador(Operador op) {
        Map<String, Object> data = repositorio.CodigoGenerado(op.getCliente().getId(), op.getActividad().getId(),
                op.getStatus(), op.getCodGenerado(), op.getComentarios());

        return data;
    }

}
