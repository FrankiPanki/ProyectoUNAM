package com.cocay.sicecd.controller;

import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cocay.sicecd.model.Grupo;
import com.cocay.sicecd.repo.CursoRep;
import com.cocay.sicecd.repo.GrupoRep;

@Controller
public class ConsultaGrupoController {
	@Autowired
	GrupoRep grupo;
	@Autowired
	CursoRep curso;
	
	@RequestMapping(value = "/consultaGrupo", method = RequestMethod.GET)
	public String consultaCurso(Model model) {
		return "ConsultarGrupo/consultaGrupo";
	}
	
	/*
	 * Consulta Simple de los Grupos.
	 * @author Derian Estrada
	 */
	@RequestMapping(value = "/consultaSimpleGrupo", method = RequestMethod.POST)
	public ModelAndView consultaSimpleGrupo(ModelMap model,HttpServletRequest request) throws ParseException {
		String fecha_inicio_grupo = request.getParameter("fecha_inicio_grupo");
		String fecha_fin_grupo = request.getParameter("fecha_fin_grupo");
		String clave_grupo = request.getParameter("clave_grupo").toUpperCase().trim();
		String curso_grupo = request.getParameter("curso_grupo").toUpperCase().trim();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date fecha_ini, fecha_fin;
		List<Grupo> grupos_1, grupos_2;
		
		if (fecha_inicio_grupo != "" && fecha_fin_grupo != ""){
			fecha_ini = format.parse(fecha_inicio_grupo);
			fecha_fin = format.parse(fecha_fin_grupo);
			grupos_1 = grupo.findByFecha(fecha_ini, fecha_fin);
			grupos_2 = grupo.findByFecha(fecha_ini, fecha_fin);
		}else {
			grupos_1 = grupo.findAll();
			grupos_2 = grupo.findAll();
		}
		
		//Filtrando por clave de grupo
		if (clave_grupo != null) {
			for(Grupo g : grupos_1) {
				String gclave = normalizar( g.getClave() ).toUpperCase().trim();
				if(!gclave.contains(clave_grupo)){
					grupos_2.remove(g);
				}
			}
		}
		
		//Filtrando por clave de curso
		if (curso_grupo != null) {
			for(Grupo g : grupos_1) {
				String gclave = normalizar( g.getFk_id_curso().getClave() ).toUpperCase().trim();
				if( !gclave.contains(curso_grupo) ) {
					grupos_2.remove(g);
				}
			}
		}
		
		if(!grupos_2.isEmpty() || grupos_2.size() > 0) {
			model.put("grupos", grupos_2);
			return new ModelAndView("ConsultarGrupo/muestraListaGrupo",model);
		} else {
			return new ModelAndView("/Avisos/ErrorBusqueda");
		}
	}
	
	/*
	 * Consulta Avanzada de los Grupos.
	 * @author Derian Estrada
	 */
	@RequestMapping(value = "/consultaAvanzadaGrupo", method = RequestMethod.POST)
	public ModelAndView consultaAvanzadaGrupo(ModelMap model,HttpServletRequest request) throws ParseException {
		String fecha_inicio_grupo_1 = request.getParameter("fecha_inicio_grupo_1");
		String fecha_inicio_grupo_2 = request.getParameter("fecha_inicio_grupo_2");
		String fecha_fin_grupo_1 = request.getParameter("fecha_fin_grupo_1");
		String fecha_fin_grupo_2 = request.getParameter("fecha_fin_grupo_2");
		String clave_grupo = request.getParameter("clave_grupo").toUpperCase().trim();
		String curso_grupo = request.getParameter("curso_grupo").toUpperCase().trim();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date fecha_ini_1, fecha_ini_2, fecha_fin_1, fecha_fin_2;
		List<Grupo> grupos_1, grupos_2;
		
		if(fecha_inicio_grupo_1 != "" && fecha_fin_grupo_1 == "") {
			fecha_ini_1 = format.parse(fecha_inicio_grupo_1);
			fecha_ini_2 = format.parse(fecha_inicio_grupo_2);
			grupos_1 = grupo.findByFechaInicio(fecha_ini_1, fecha_ini_2);
			grupos_2 = grupo.findByFechaInicio(fecha_ini_1, fecha_ini_2);
		}else if (fecha_inicio_grupo_1 == "" && fecha_fin_grupo_1 != ""){
			fecha_fin_1 = format.parse(fecha_fin_grupo_1);
			fecha_fin_2 = format.parse(fecha_fin_grupo_2);
			grupos_1 = grupo.findByFechaFin(fecha_fin_1, fecha_fin_2);
			grupos_2 = grupo.findByFechaFin(fecha_fin_1, fecha_fin_2);
		}else if (fecha_inicio_grupo_1 != "" && fecha_fin_grupo_1 != ""){
			fecha_ini_1 = format.parse(fecha_inicio_grupo_1);
			fecha_ini_2 = format.parse(fecha_inicio_grupo_2);
			fecha_fin_1 = format.parse(fecha_fin_grupo_1);
			fecha_fin_2 = format.parse(fecha_fin_grupo_2);
			grupos_1 = grupo.findByFecha(fecha_ini_1, fecha_ini_2, fecha_fin_1, fecha_fin_2);
			grupos_2 = grupo.findByFecha(fecha_ini_1, fecha_ini_2, fecha_fin_1, fecha_fin_2);
		}else {
			grupos_1 = grupo.findAll();
			grupos_2 = grupo.findAll();
		}
		
		//Filtrando por clave de grupo
		if (clave_grupo != null) {
			for(Grupo g : grupos_1) {
				String gclave = normalizar( g.getClave() ).toUpperCase().trim();
				if(!gclave.contains(clave_grupo)){
					grupos_2.remove(g);
				}
			}
		}
		
		//Filtrando por clave de curso
		if (curso_grupo != null) {
			for(Grupo g : grupos_1) {
				String gclave = normalizar( g.getFk_id_curso().getClave() ).toUpperCase().trim();
				if( !gclave.contains(curso_grupo) ) {
					grupos_2.remove(g);
				}
			}
		}
		
		if(!grupos_2.isEmpty() || grupos_2.size() > 0) {
			model.put("grupos", grupos_2);
			return new ModelAndView("ConsultarGrupo/muestraListaGrupo",model);
		} else {
			return new ModelAndView("/Avisos/ErrorBusqueda");
		}
	}
	
	public String normalizar(String src) {
        return Normalizer
                .normalize(src , Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]" , "");
    }
}
