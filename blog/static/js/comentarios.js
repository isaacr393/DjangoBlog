var btnEnviarComentario = document.getElementById('enviarComentario');

btnEnviarComentario.addEventListener('click',function(){
    comentario = document.getElementById('commentary-text').value;

    ajax = new XMLHttpRequest();
    ajax.open('post','/recibirComentario/',1);
    ajax.onreadystatechange = function(){
        if ( ajax.readyState == 4 && ajax.status == 200 ){
            var respuesta = ajax.responseText;
            respuesta = JSON.parse(respuesta);
            crearSubcomentario(respuesta,'comments');
        }
    }
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //El ultimo parametro es utilizado para pasarle el token de csrf que exige django cuando se realiza una 
    //peticion post de lo contrario no nos permitira la conexion
    ajax.send('comentario=' + comentario + '&user=' + userId + '&post=' + postId + '&orden=0' + '&csrfmiddlewaretoken='+ window.CSRF_TOKEN);
})  




////Añadir eventos para mostrar y ocultar los comentarios dentro de los comentarios
var answerCommentary = document.querySelectorAll('.commentary-answer-responder');

answerCommentary.forEach(function(element, index){

    element.addEventListener('click', function(){
        idStart = element.id.lastIndexOf('-');
        id = element.id.slice(idStart+1, element.id.length);
        document.getElementById('div-answer-textarea-'+id).style.display = 'block';
        document.getElementById('div-answer-submit-'+id).style.display = 'block';
        document.getElementById('div-answer-cancel-'+id).style.display = 'block';
    });
});

var cancelCommentary = document.querySelectorAll('.commentary-answer-cancel');

cancelCommentary.forEach(function(element){

    element.addEventListener('click', function(){
        idStart = element.id.lastIndexOf('-');
        id = element.id.slice(idStart+1, element.id.length);
        document.getElementById('div-answer-textarea-'+id).style.display = 'none';
        document.getElementById('div-answer-submit-'+id).style.display = 'none';
        this.style.display = 'none';
    });
});


//Funcion para crear comentarios
function crearSubcomentario(respuesta, idDestino){

    newComment = document.createDocumentFragment();
    divComment = document.createElement('div');//Se crea el div donde se almacenaran los comentarios
    divUser = document.createElement('h3');//Se crea el header donde va el usuario del comentario
    divSubcommentaryData = document.createElement('div');//Div donde se alojaran los comentarios creados a los comentarios
    divAnswer = document.createElement('div');//Se crea el div donde va la seccion de comentar los comentarios

    //Se crea el header de los comentarios
    divUser.className = 'commentary-object-header';
    divUser.id = 'commentary-object-header-'+respuesta.comentarioId;
    divUser.innerHTML = user;

    //Se crea el contenido de los comentarios
    divCommentContent = document.createElement('p');//Se crea el parrafo donde estara el contenido del comentario
    divCommentContent.className = 'commentary-object-content';
    divCommentContent.id = 'commentary-object-content-'+respuesta.comentarioId;
    divCommentContent.innerHTML = respuesta.contenido;

    //Se crea la seccion donde se mostraran los comentarios realizados a otros comentarios
    divSubcommentaryData.id = 'subcommentaries-data-' + respuesta.comentarioId;
    divSubcommentaryData.className = 'subcommentaries-data';

    //Se crea la seccion de comentarios dentro de los comentarios
    divAnswer = document.createElement('div');//Se crea el div donde va la seccion de comentar los comentarios
    divAnswer.className = 'commentary-answer';
    divAnswer.id = 'commentary-answer-'+ respuesta.comentarioId;
    divAnswerResponder = document.createElement('p');//Se crea el link que hara el toggle para comentar 
    divAnswerResponder.className = 'commentary-answer-responder';
    divAnswerResponder.id = 'div-answer-responder-' + respuesta.comentarioId;
    divAnswerResponder.innerHTML = 'Responder';


    divAnswerTextarea = document.createElement('textarea');//Textarea donde se creara el comentario
    divAnswerTextarea.className = 'commentary-answer-textarea';
    divAnswerTextarea.setAttribute('cols','10');
    divAnswerTextarea.setAttribute('rows','3');
    divAnswerTextarea.setAttribute('name','commentaryFromCommentary');
    divAnswerTextarea.id = 'div-answer-textarea-' + respuesta.comentarioId;

    divAnswerSubmit = document.createElement('p');//Boton con el cual se confirma el comentario
    divAnswerSubmit.className = 'commentary-answer-submit';
    divAnswerSubmit.id = 'div-answer-submit-' + respuesta.comentarioId;
    divAnswerSubmit.innerHTML = 'Enviar';

    divAnswerCancel = document.createElement('p');//Boton con el cual se cancela el envio de comentario
    divAnswerCancel.className = 'commentary-answer-cancel';
    divAnswerCancel.id = 'div-answer-cancel-' + respuesta.comentarioId;
    divAnswerCancel.innerHTML = 'Cancelar';
    
    divAnswer.appendChild(divAnswerResponder);
    divAnswer.appendChild(divAnswerTextarea);
    divAnswer.appendChild(divAnswerSubmit);
    divAnswer.appendChild(divAnswerCancel); 


    //Se agregan al nuevo comentario todas las subsecciones, como lo son el header, el contenido y la funcion de responder 
    divComment.appendChild(divUser);
    divComment.appendChild(divCommentContent);
    divComment.appendChild(divAnswer);
    divComment.appendChild(divSubcommentaryData);
    divComment.className = 'commentary-object';
    divComment.id = respuesta.comentarioId;
    newComment.appendChild(divComment);


    document.getElementById(idDestino).appendChild(newComment);

    divAnswerResponder.addEventListener('click',function(){
        document.getElementById('div-answer-textarea-'+respuesta.comentarioId).style.display = 'block';
        document.getElementById('div-answer-submit-'+respuesta.comentarioId).style.display = 'block';
        document.getElementById('div-answer-cancel-'+respuesta.comentarioId).style.display = 'block';
    })

    divAnswerCancel.addEventListener('click',function(){
        document.getElementById('div-answer-textarea-'+respuesta.comentarioId).style.display = 'none';
        document.getElementById('div-answer-submit-'+respuesta.comentarioId).style.display = 'none';
        this.style.display = 'none';
    })

    divAnswerSubmit.addEventListener('click',function(){
        generarSubComentario(this);
    })
}

var subCommentSend = document.querySelectorAll('.commentary-answer-submit');

subCommentSend.forEach(function(element){

    element.addEventListener('click', function(){
        generarSubComentario(this);
    });
});


function generarSubComentario(boton){
    idStart = boton.id.lastIndexOf('-');
    id = boton.id.slice(idStart+1, boton.id.length);
    contenido = document.getElementById('div-answer-textarea-' + id).value;
    var orden;


    //procedimiento para observar el orden del comentario anterior y asi obtener su propio orden
    var getOrden = new XMLHttpRequest();
    getOrden.open('post','/devolverOrden/',1);
    getOrden.onreadystatechange = function(){
        if( getOrden.readyState == 4 && getOrden.status == 200 ){
            var respuesta = getOrden.responseText;
            respuesta =  JSON.parse(respuesta);
            orden = respuesta.orden;
            
            var ajax = new XMLHttpRequest();
            ajax.open('post','/recibirSubComentario/',1);

            ajax.onreadystatechange = function(){
                if( ajax.readyState == 4 && ajax.status == 200 ){
                    var respuesta = ajax.responseText;
                    respuesta =  JSON.parse(respuesta);
                    crearSubcomentario(respuesta,'subcommentaries-data-'+id);
                    console.log(orden);
                }
            }
            ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajax.send('id='+ id + '&orden='+ orden + '&user='+ userId + '&post='+ postId+ '&comentario='+ contenido +'&csrfmiddlewaretoken='+ window.CSRF_TOKEN);

        }
    }
    getOrden.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    getOrden.send('id='+ id +'&csrfmiddlewaretoken='+ window.CSRF_TOKEN);
};
