package com.cocay.sicecd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.cocay.sicecd.LogTypes;
import com.cocay.sicecd.model.Usuario_sys;
import com.cocay.sicecd.repo.Usuario_sysRep;
import com.cocay.sicecd.service.Logging;
import com.cocay.sicecd.service.SendMailService;

@Controller
public class RecuperaContrasena {
	@Autowired
	Usuario_sysRep _usuarioSys;
	@Autowired
	SendMailService _email;
@Value("spring.mail.username")
String origen;

@Value("${path_dominio}")
String dominio;

@Autowired
Logging log;

	@PostMapping("/enviarecupera")
	private ResponseEntity<String> enviarecupera(@RequestBody Usuario_sys consulta) {
		String mensaje="";
		if (! _usuarioSys.existsByRfc(consulta.getRfc())) {
			mensaje="rfc no valido";
		}else {
			Usuario_sys guardado=_usuarioSys.findByRfc(consulta.getRfc()).get(0);
			String codigo = String.valueOf((int) (Math.random() * 1000) + 1);
			String link = dominio + "configuracionPass?codigo=" + codigo + "&usuario="
					+ guardado.getPk_id_usuario_sys();
			String from = origen;
			String to = guardado.getCorreo();
			String subject = "Recuperacion de contraseña";
			String body = "Hola da clic al siguiente  link \n" + link + "\npara confirmar tu correo.";
			_email.sendMail(from, to, subject, body);
			guardado.setCodigorecupera(codigo);
			guardado.setConfirmarecupera("true");
			_usuarioSys.save(guardado);
			String correoo=guardado.getCorreo();
			mensaje="Se ha enviado un link a "+correoo.substring(0,3)+"*****"+correoo.substring(correoo.length()-3,correoo.length());
		}
		log.setTrace(LogTypes.RECUPERA_CONTRASEÑA);

		return ResponseEntity.ok(mensaje);
		
	}
	
	
}
