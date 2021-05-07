package com.edu.pe.repository;

import com.edu.pe.models.Operador;
import java.util.List;
import java.util.Map;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OperadorRepository extends JpaRepository<Operador, Integer> {

    @Query(value = "{call usp_Insert_Operador(?,?,?,?,?)}", nativeQuery = true)
    public Map<String,Object>CodigoGenerado(Integer codCliente, Integer idActividad,
            Integer status, String codGenerado, String comentarios);
}
