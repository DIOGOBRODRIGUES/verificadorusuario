<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        /* Estilos simples para o feedback */
        .disponivel { color: green; font-weight: bold; }
        .indisponivel { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <h2>Formulário de Cadastro</h2>
    <form>
        <div>
            <label for="username">Nome de Usuário:</label>
            <input type="text" id="username" name="username">
            <span id="statusUsuario"></span>
        </div>
        <div>
            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha">
        </div>
        <button type="submit">Cadastrar</button>
    </form>

    <script>
 // Espera o documento carregar
    $(document).ready(function() {

        // Seleciona o campo de username e escuta o evento 'keyup'
        $('#username').on('keyup', function() {
            // 1. Pegar o valor digitado
            var username = $(this).val();

            // 2. Pegar o elemento onde mostraremos o status
            var statusSpan = $('#statusUsuario');

            // 3. Só faz a requisição se tiver algo digitado
            if (username.length > 2) { 

                // 4. A chamada AJAX (o coração do projeto)
                $.ajax({
                    url: 'verificar.jsp',  // A URL do nosso script de servidor
                    type: 'POST',          // Método (pode ser GET também)
                    data: {                // Os dados que vamos enviar
                        usuario: username
                    },

                    // 5. Função que executa se a chamada der CERTO
                    success: function(resposta) {
                        // 'resposta' é o que o 'verificar.jsp' imprimiu (out.print)

                        if (resposta.trim() === 'disponivel') {
                            statusSpan.text('Nome disponível!');
                            statusSpan.removeClass('indisponivel').addClass('disponivel');
                        } else if (resposta.trim() === 'indisponivel') {
                            statusSpan.text('Nome já está em uso.');
                            statusSpan.removeClass('disponivel').addClass('indisponivel');
                        } else {
                            statusSpan.text(''); // Limpa se a resposta for vazia
                        }
                    },

                    // 6. (Opcional) Função que executa se der ERRO
                    error: function() {
                        statusSpan.text('Erro ao verificar.');
                        statusSpan.removeClass('disponivel').addClass('indisponivel');
                    }
                });

            } else {
                // Limpa o status se o campo estiver muito curto
                statusSpan.text('');
            }
        });

    });
    </script>
</body>
</html>