package com.cocay.sicecd.repo;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cocay.sicecd.model.Estado;
import com.cocay.sicecd.model.TestClass;

@Repository
public interface EstadoRep extends PagingAndSortingRepository<Estado, Integer>{
	
	List<Estado> findByNombre(String nombre);

}
