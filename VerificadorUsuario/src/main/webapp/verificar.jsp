<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- Remove qualquer HTML ou espaço em branco antes desta tag --%>
<%
    // 1. Simulação de um "banco de dados"
    String[] usuariosExistentes = {"admin", "maria", "joao123", "teste"};

    // 2. Pegar o parâmetro enviado pelo jQuery (ex: ?usuario=...)
    String usuarioParaVerificar = request.getParameter("usuario");

    boolean disponivel = true;

    // 3. Lógica de verificação
    if (usuarioParaVerificar != null && !usuarioParaVerificar.trim().isEmpty()) {
        for (String existente : usuariosExistentes) {
            if (existente.equalsIgnoreCase(usuarioParaVerificar)) {
                disponivel = false;
                break;
            }
        }
    } else {
        // Não retorna nada se o campo estiver vazio
        return; 
    }

    // 4. Enviar a resposta de volta (apenas texto)
    if (disponivel) {
        out.print("disponivel");
    } else {
        out.print("indisponivel");
    }
%>