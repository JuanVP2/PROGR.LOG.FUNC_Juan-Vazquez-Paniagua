:- use_module(library(pce)).

:- pce_global(@name_prompter, make_name_prompter).

        % crea dialog e ingreso de nombre
        make_name_prompter(P) :-
                new(P, dialog),
                send(P, kind, transient),
                send(P, append, label(prompt)),
                send(P, append,
                        new(TI, text_item(name, '',
                                 message(P?ok_member, execute)))),
                send(P, append, button(ok, message(P, return, TI?selection))),
                %%send(P, append, button(ok, message(@prolog,pp))),
                send(P, append, button(cancel, message(P, return, @nil))).

        %MuestraElDialogoIngresarElNombreYBuscarLaInformacion__EnNameEstaElNombre
        buscar_nombre(Prompt, Label, Name) :-
                send(@name_prompter?prompt_member, selection, Prompt),
                send(@name_prompter?name_member, label, Label),
                send(@name_prompter?name_member, clear),
                get(@name_prompter, confirm_centered, RawName),
                send(@name_prompter, show, @off),
                RawName \== @nil,
                Name = RawName.
        
        %MostrarInfromacionDeLosPlantas
        buscar_info_planta:-
                  buscar_nombre('Informacion sobre una planta','Planta:', Planta),
                  metodo_info_planta(Planta).

        buscar_propiedad_plantas:-
                    buscar_nombre('Plantas segun su propiedad ','Propiedad:', Propiedad),
                    metodo_listar_plantas_propiedad(Propiedad).
                  
        buscar_info_medicamento:-
                  buscar_nombre('Informacion sobre un medicamento','Medicamento:', Medicamento),
                  metodo_info_medicamento(Medicamento).

        buscar_info_enfermedad:-
                  buscar_nombre('Informacion sobre una enfermedad','Enfermedad:', Enfermedad),
                  metodo_info_enfermedad(Enfermedad).
                  
        buscar_enfermedades_curadas_por:-
                  buscar_nombre('Enfermedades cuaradas por una planta','Planta:', Planta),
                  metodo_enfermedades_curadas_por(Planta).
        
        buscar_metodo_preparacion:-
                  buscar_nombre('Metodos de preparacion','Metodo:', FormaUso),
                  metodo_forma_preparacion(FormaUso).
        
        buscar_Termino:-
                    buscar_nombre('Definicion De Terminos','Termino:', Termino),
                    metodo_significado_De_Terminos(Termino).
                  
%-------------INTERFAZ-------------
    run :-
            % Iniciar Programa
            new(D, dialog('Sistema Experto "El Yerberito Ilustrado" | ECM JVP DJVC')),
            send(D, size, size(1260, 430)),

            % Mostrar la imagen
            send(D, append, new(Imagen, menu_bar)),
            mostrarImagen('C:/Sistema-Experto-Yerberito/images/0_Portada.jpg', D, Imagen),
            send(D, append, Imagen, right),

            % Crear un panel interno para las consultas
            new(P, dialog_group('Consultas')),
            send(P, gap, size(10, 10)), % Espacio entre elementos
            % Agregar las consultas dentro del panel
            send(P, append, button('Consultar Planta', message(@prolog, buscar_info_planta))),
            send(P, append, button('Consultar Plantas Segun Su Propiedad', message(@prolog, buscar_propiedad_plantas)), below),
            send(P, append, button('Consultar Medicamento', message(@prolog, buscar_info_medicamento)), below),
            send(P, append, button('Consultar Enfermedad', message(@prolog, buscar_info_enfermedad)), below),
            send(P, append, button('Consultar Enfermedades Cuaradas Por Una Planta', message(@prolog, buscar_enfermedades_curadas_por)), below),
            send(P, append, button('Consultar Metodos De Preparacion', message(@prolog, buscar_metodo_preparacion)), below),
            % Agregar el panel a la derecha.
            send(D, append, P, right),
            
            % Crear un panel interno para los listados
            new(L, dialog_group('Listados')),
            send(L, gap, size(10, 10)), % Espacio entre elementos
            % Agregar las listas dentro del panel
            send(L, append, button('Listar Elementos De Las Plantas', message(@prolog, metodo_listar_elementos))),
            send(L, append, button('Listar Plantas Y Su Metodo De Preparacion', message(@prolog, metodo_listar_plantas_uso)), below),
            send(L, append, button('Listar Propiedades Y Sus Efectos', message(@prolog, metodo_listar_propiedades_efectos)), below),
            send(L, append, button('Listar Plantas Que Producen Medicamentos', message(@prolog, metodo_produce_medicamento)), below),
            send(L, append, button('Listar Plantas', message(@prolog, metodo_listar_plantas)), below),
            send(L, append, button('Listar Medicamentos', message(@prolog, metodo_lista_medicamentos)), below),
            send(L, append, button('Listar Enfermedades', message(@prolog, metodo_lista_padecimientos)), below),
            send(L, append, button('Listar Plantas Y Sus Propiedades', message(@prolog, metodo_listar_planta_efecto)), below),
            % Agregar el panel a la derecha.
            send(D, append, L, right),

            % Crear un panel interno para las opciones
            new(I, dialog_group('Informacion')),
            send(I, gap, size(10, 10)), % Espacio entre elementos
            send(I, append, button('Nombres Cientificos De Plantas', message(@prolog, metodo_listar_planta_y_nombre_cientifico)), below),
            send(I, append, button('Origenes De Las Plantas', message(@prolog, metodo_lista_origenes)), below),
            send(I, append, button('Definicion De Terminos', message(@prolog, buscar_Termino)), below),
            send(I, append, button('Botiquin De Emergencias', message(@prolog, metodo_botiquin)), below),
            send(D, append, I, right),

            % Abrir el diálogo
            send(D, open, point(150, 230)),
            consult('C:/Sistema-Experto-Yerberito/Data.pl'),
            nl.

    % Mostrar Imagenes
    mostrarImagen(V, D, M):- 
            new(I, image(V)),
            new(B, bitmap(I)),
            new(F2, figure),
            send(F2, display, B),
            %DondeSeVeraLaImagen
            new(D1, device),
            send(D1, display, F2),
            send(D, display, D1,point(10,10)),
            send(D1,below(M)).

%-------------INFORMACION DE PLANTA-------------    
    metodo_info_planta(Planta):-
        % Datos 
        nombre(Planta, Nombre),
        planta_origen(Planta, Origen),

        %efectos_planta(Planta, Efectos),
        findall(Efecto, propiedad_planta(Planta, Efecto), Efectos),
        findall(Medicamento, planta_obtiene(Planta, Medicamento), Medicamentos),
        findall(FormaUso, se_usa_como(Planta, FormaUso), FormasUso),

        atom_concat('Consultar Planta | ', Planta, Titulo),
        new(D, dialog(Titulo)),
        send(D, size, size(400,500)),
        send(D, colour, colour(black)),
        
        % Planta ligada con malestares
        findall(Malestar, usado_para_tratar(Planta, Malestar), Enfermedades),

        send(D, open, point(500, 200)),

        send(D, display, text('Nombre comun: ', center, bold), point(200,15)),
        send(D, display, text(Planta, center, normal), point(210,30)),

        send(D, display, text('Nombre cientifico: ', center, bold), point(200,50)),
        send(D, display, text(Nombre, center, normal), point(210,65)),
        
        send(D, display, text('Continente Origen: ', center, bold), point(200,85)),
        send(D, display, text(Origen, center, normal), point(210,100)),

        % Mostrar imagenes
        send(D, append, new(Menu, menu_bar)),
        
        %ConvertirListaDeEnfermedadesAStringConInterlineado
        atomic_list_concat(Enfermedades, '\n', EnfermedadesStr),
        atomic_list_concat(Efectos, '\n', EfectosStr),
        atomic_list_concat(Medicamentos, '\n', MedicamentosStr),
        atomic_list_concat(FormasUso, '\n', FormasUsoStr),

        send(D, display, text('Cura Enfermedades', left, bold), point(200,170)), nl,
        send(D, display, text(EnfermedadesStr, left, normal), point(200,185)),

        send(D, display, text('Produce Medicamentos', left, bold), point(10,170)),nl,
        send(D, display, text(MedicamentosStr, left, normal), point(10,185)),

        send(D, display, text('Propiedades', left, bold), point(10,230)), nl,
        send(D, display, text(EfectosStr, left, normal), point(10,245)),

        send(D, display, text('Metodos De Preparacion', left, bold), point(10,300)),nl,
        send(D, display, text(FormasUsoStr, left, normal), point(10,315)),    
        
        %MostrarLaImagenDeLaPlanta
        unirPlantaImagen(Planta, Foto),
        mostrarImagen(Foto, D, Menu),
        nl.

%-------------PROPIEDAD DE LAS PLANTAS-------------     
metodo_listar_plantas_propiedad(Propiedad):-
    %Datos 
    findall(Planta, propiedad_planta(Planta, Propiedad), Plantas),
    atomic_list_concat(Plantas, '\n', PlantasStr),

    atom_concat('Consultar Plantas Segun Su Propiedad | ', Propiedad, Titulo),
    new(D, dialog(Titulo)),
    send(D, size, size(400,500)),
    send(D, colour, colour(black)),

    send(D, display, text(Titulo, left, bold), point(10,10)),
    new(W, window("Plantas con la propiedad: ", size(370, 470))),
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    send(W, display, text(PlantasStr, left, normal), point(10, 10)),
    %Agregar la ventana con scroll al diálogo
    send(D, append, W),
    send(D, open, point(500, 200)).

%-------------INFORMACION DE MEDICAMENTO-------------     
    metodo_info_medicamento(Medicamento):-
        %Datos 
        efectos_de_medicamento(Medicamento, Efectos),
        atomic_list_concat(Efectos, '\n', EfectosStr),

        findall(Planta, planta_obtiene(Planta, Medicamento), Plantas),
        atomic_list_concat(Plantas, '\n', PlantasStr),

        atom_concat('Consultar Medicamento | ', Medicamento, Titulo),
        new(D, dialog(Titulo)),
        send(D, size, size(400,500)),
        send(D, colour, colour(black)),
        
        %BuscarTodasLasVecesQueLaPlantaEstaLigadaConUnMalestar
        send(D, open, point(500, 200)),

        send(D, display, text('Nombre: ', center, bold), point(10,15)),
        send(D, display, text(Medicamento, center, normal), point(20,30)),

        send(D, display, text('Efectos: ', center, bold), point(10,50)),
        send(D, display, text(EfectosStr, center, normal), point(20,65)),

        send(D, display, text('Plantas que lo generan: ', center, bold), point(10,85)),
        send(D, display, text(PlantasStr, center, normal), point(20,100)).

%-------------INFORMACION DE ENFERMEDAD------------- 
    metodo_info_enfermedad(Enfermedad):-
        % Obtener la lista de plantas que se usan para tratar la enfermedad
        findall(Planta, usado_para_tratar(Planta, Enfermedad), Plantas),
        % Obtener la lista de formas de uso de las plantas
        findall(FormaUso, (member(Planta, Plantas), se_usa_como(Planta, FormaUso)), FormasUso),
        % Combinar las listas de plantas y formas de uso en una lista de pares [Planta, FormaUso]
        combinar_listas(Plantas, FormasUso, Resultados),
        % Mostrar la información en el diálogo
        % mostrar_info_enfermedad(Enfermedad, Resultados)
        
        atom_concat('Consultar Enfermedad | ', Enfermedad, Titulo),
        new(D, dialog(Titulo)),
        send(D, size, size(400,500)),
        send(D, colour, colour(black)),
        
        send(D, display, text('Enfermedad:', left, bold), point(10,0)),
        %send(D, display, text(Enfermedad, center, normal), point(20,50)),
        send(D, append, text(Enfermedad, center, normal)),
        % Crear una ventana con scroll
        send(D, append, text('Planta y Metodo De Preparacion:', left, bold)),
        new(W, window('Propiedades de plantas y usos', size(300, 300))),
        send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
        
        % Mostrar los resultados en la ventana con scroll
        mostrar_resultados2(Resultados, W, 10),
        
        % Agregar la ventana con scroll al diálogo
        send(D, append, W),

        % Abrir el diálogo
        send(D, open, point(500, 200)).
        
    % Mostrar los resultados en la ventana aplicando recursividad.
        mostrar_resultados2([], _, _).
        mostrar_resultados2([[Planta, FormaUso] | Resto], W, Y) :-
            send(W, display, text(Planta, left, normal), point(10, Y)),
            send(W, display, text(FormaUso, left, normal), point(150, Y)),
            NewY is Y + 15,  % Incrementar la posición Y para la siguiente línea
            mostrar_resultados2(Resto, W, NewY).

    % Combina dos listas en una lista de pares [X, Y]
        combinar_listas([], [], []).
        combinar_listas([X|Xs], [Y|Ys], [[X,Y]|Resto]) :-
            combinar_listas(Xs, Ys, Resto).
        combinar_listas(_, _, []).  % En caso de que las listas no tengan la misma longitud 
%-------------ENFERMEDADES CURADAS POR------------- 
metodo_enfermedades_curadas_por(Planta):-
    %AsignacionDelNombreParaVentanaEmergente
    atom_concat('Consultar Enfermedades Curadas Por Una Planta | ', Planta, Titulo),
    new(D, dialog(Titulo)),
    send(D, size, size(400,500)),
    send(D, colour, colour(black)),

    %EstoSeUsaParaMostrarLaImagenDespues
    send(D, append, new(Menu, menu_bar)),
    
    %BuscarTodasLasVecesQueLaPlantaEstaLigadaConUnMalestar
    findall(Malestar, usado_para_tratar(Planta, Malestar), Enfermedades),
    send(D, open, point(500, 200)),

    %MostrarPlantaSeguidoDelNombre
    send(D, display, text('Planta: ', left, bold), point(200,35)),
    send(D, display, text(Planta, left, normal), point(270,35)),
    
    %MostrarEtiquetaDeMalestaresParaTratar
    send(D, display, text('Cura: ', left, bold), point(200,60)),
    nl,
    
    %ConvertirListaDeEnfermedadesAStringConInterlineado
    atomic_list_concat(Enfermedades, '\n', EnfermedadesStr),
    
    %MostrarLosResultadosDeLaListaEnLaVentana
    send(D, display, text(EnfermedadesStr, left, normal), point(200,80)),
    %MostrarLaImagenDeLaPlanta
    unirPlantaImagen(Planta, Foto),
    mostrarImagen(Foto, D, Menu),
    nl.

%-------------METODOS DE PREPARACION-------------    
metodo_forma_preparacion(FormaUso):-
    %Datos 
    ingredientes(FormaUso, Ingredientes),
    parte_planta(FormaUso, Partes),
    tiempo(FormaUso, Tiempo),
    administracion(FormaUso, Administracion),
    instrucciones(FormaUso, Instrucciones),

    atom_concat('Consultar Metodo De Preparacion | ', FormaUso, Titulo),
    new(D, dialog(Titulo)),
    send(D, size, size(500,500)),
    send(D, colour, colour(black)),
    
    send(D, open, point(500, 100)),

    atom_concat('', FormaUso, Header),
    send(D, display, text(Header, left, bold), point(10,10)),

    send(D, display, text('Ingredientes: ', left, bold), point(10,30)),
    send(D, display, text(Ingredientes, left, normal), point(15,50)),

    send(D, display, text('Partes Utilizadas: ', left, bold), point(110,30)),
    send(D, display, text(Partes, left, normal), point(115,50)),
    
    send(D, display, text('Tiempo: ', left, bold), point(250,30)),
    send(D, display, text(Tiempo, left, normal), point(255,50)),
    
    send(D, display, text('Via De Administracion: ', left, bold), point(330,30)),
    send(D, display, text(Administracion, left, normal), point(335,50)),

    send(D, display, text('Instrucciones', left, bold), point(10,100)),
    send(D, display, text(Instrucciones, left, normal), point(15,120)).


%-------------LISTA DE PLANTAS Y ELEM-------------      
    metodo_listar_elementos:-
        new(D, dialog('Listar Elementos De Las Plantas')),
        send(D, size, size(310, 400)),
        send(D, colour, colour(black)),
        findall(Medicamento, medicamento(Medicamento), Medicamento),
        %Crear una ventana con scroll
        send(D, display, text('Elementos que se encuentran en las plantas:', center, bold), point(10, 10)),
        new(W, window('Elementos que se encuentran en las plantas:', size(250, 370))),
        send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
        %Convertir la lista de plantas a string con interlineado
        atomic_list_concat(Medicamento, '\n', MedicamentoStr),
        %Mostrar los resultados de la lista en la ventana con scroll
        send(W, display, text(MedicamentoStr, left, normal), point(30, 10)),
        %Agregar la ventana con scroll al diálogo
        send(D, append, W),
        %Abrir el diálogo
        send(D, open, point(800, 200)).

%-------------LISTA PLANTAS Y METODO DE PREP-------------  
metodo_listar_plantas_uso :-
    new(D, dialog('Listar Plantas Y Su Metodo De Preparacion')),
    send(D, size, size(400, 400)),
    send(D, colour, colour(black)),
    
    % Buscar todas las propiedades y sus efectos
    findall([Planta, FormaUso], se_usa_como(Planta, FormaUso), Resultados),
    
    % Crear una ventana con scroll
    send(D, append, new(text('Plantas y metodo de preparacion:', left, bold))),
    new(W, window('Propiedades de la plantas y sus efectos', size(380, 370))),
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    % Mostrar los resultados en la ventana con scroll
    mostrar_resultados(Resultados, W, 10),
    
    % Agregar la ventana con scroll al diálogo
    send(D, append, W),
    
    % Abrir el diálogo
    send(D, open, point(800, 200)).

%-------------LISTA PLANTAS PRODC MED-------------
metodo_produce_medicamento:-
    new(D, dialog('Listar Plantas Que Producen Medicamentos')),
    send(D, size, size(400, 430)),
    send(D, colour, colour(black)),
    
    plantas_que_producen_medicamentos(Plantas),

    %Crear una ventana con scroll
    send(D, display, text('Plantas que producen medicamentos: ', left, bold), point(10, 10)),
    
    %Agregar la ventana con scroll al diálogo
    new(W, window('Plantas', size(380, 400))),
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    %Convertir la lista de plantas a string con interlineado
    atomic_list_concat(Plantas, '\n', PlantasStr),
    
    %Mostrar los resultados de la lista en la ventana con scroll
    send(W, display, text(PlantasStr, left, normal), point(10, 25)),
    send(D, append, W),
    
    %Abrir el diálogo
    send(D, open, point(800, 200)).

%-------------LISTA PLANTAS------------- 
    metodo_listar_plantas :-
        % AsignacionDelNombreParaVentanaEmergente
        new(D, dialog('Listar Plantas')),
        send(D, size, size(400, 430)),
        send(D, colour, colour(black)),
        %Buscar todas las veces que la planta está ligada con un malestar
        findall(Planta, planta(Planta), Plantas),
        %Crear una ventana con scroll
        send(D, display, text('Plantas: ', center, bold), point(10, 10)),
        %Agregar la ventana con scroll al diálogo
        new(W, window('Plantas', size(380, 400))),
        send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
        %Convertir la lista de plantas a string con interlineado
        atomic_list_concat(Plantas, '\n', PlantasStr),
        %Mostrar los resultados de la lista en la ventana con scroll
        send(W, display, text(PlantasStr, left, normal), point(10, 10)),
        send(D, append, W),
        %Abrir el diálogo
        send(D, open, point(800, 200)).

%-------------LISTA MEDICAMENTOS------------- 
metodo_lista_medicamentos:-
    new(D, dialog('Listar Medicamentos')),
    send(D, size, size(300, 450)),
    send(D, colour, colour(black)),

    findall(Medicamento, medicamento(Medicamento), Medicamentos),
    
    send(D, display, text('Medicamentos: ', left, bold), point(10, 10)),
    new(W, window('Medicamentos', size(280, 410))),
    
    %Crear una ventana con scroll
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    %Convertir la lista de medicamentos a string con salto de línea
    atomic_list_concat(Medicamentos, '\n', ListaMedicamentos),
    
    %Mostrar los resultados de la lista en la ventana con scroll
    send(W, display, text(ListaMedicamentos, left, normal), point(30, 10)),
    
    %Agregar la ventana con scroll al diálogo
    send(D, append, W),
    %Abrir el diálogo
    send(D, open, point(800, 200)).

%-------------LISTA ENFERMEDADES------------- 
metodo_lista_padecimientos:-
    new(D, dialog('Listar Enfermedades')),
    send(D, size, size(300, 450)),
    send(D, colour, colour(black)),

    findall(Enfermedad, padecimiento(Enfermedad), Enfermedades),
    
    send(D, display, text('Enfermedades: ', left, bold), point(10, 10)),
    new(W, window('Enfermedades', size(280, 410))),
    
    %Crear una ventana con scroll
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    %Convertir la lista de enfermedades a string con salto de línea
    atomic_list_concat(Enfermedades, '\n', ListaEnfermedades),
    
    %Mostrar los resultados de la lista en la ventana con scroll
    send(W, display, text(ListaEnfermedades, left, normal), point(30, 10)),
    
    %Agregar la ventana con scroll al diálogo
    send(D, append, W),
    %Abrir el diálogo
    send(D, open, point(800, 200)).  


%-------------LISTA PROP Y EFECT------------- 
metodo_listar_propiedades_efectos :-
    new(D, dialog('Listar Propiedades Y Sus Efectos')),
    send(D, size, size(400, 400)),
    send(D, colour, colour(black)),
    
    % Buscar todas las propiedades y sus efectos
    findall([Propiedad, Efecto], propiedad_efecto(Propiedad, Efecto), Resultados),
    
    % Crear una ventana con scroll
    send(D, append, new(text('Propiedades de la plantas y su efectos:', center, bold))),
    new(W, window('Propiedades de la plantas y sus efectos', size(380, 370))),
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    % Mostrar los resultados en la ventana con scroll
    mostrar_resultados(Resultados, W, 10),
    
    % Agregar la ventana con scroll al diálogo
    send(D, append, W),
    
    % Abrir el diálogo
    send(D, open, point(800, 200)).
    
    % Mostrar los resultados en la ventana aplicando recursividad.
    mostrar_resultados([], _, _).
    mostrar_resultados([[Propiedad, Efecto] | Resto], W, Y) :-
        send(W, display, text(Propiedad, left, normal), point(10, Y)),
        send(W, display, text(Efecto, left, normal), point(150, Y)),
        NewY is Y + 20,  % Incrementar la posición Y para la siguiente línea
        mostrar_resultados(Resto, W, NewY).



%-------------LISTA PLANTA Y PROP------------- 
metodo_listar_planta_efecto:-
    new(D, dialog('Listar Plantas Y Sus Propiedades')),
    send(D, size, size(400, 400)),
    send(D, colour, colour(black)),
    
    % Buscar todas las propiedades y sus efectos
    findall([Planta, Efecto], propiedad_planta(Planta, Efecto), Resultados),
    
    % Crear una ventana con scroll
    send(D, append, new(text('Planta y su propiedad: ', center, bold))),
    new(W, window('Planta y su propiedad:', size(380, 370))),
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    % Mostrar los resultados en la ventana con scroll
    mostrar_resultado_planta_y_efecto(Resultados, W, 10),
    
    % Agregar la ventana con scroll al diálogo
    send(D, append, W),
    
    % Abrir el diálogo
    send(D, open, point(1000, 200)).
    
    % Mostrar los resultados en la ventana aplicando recursividad.
    mostrar_resultado_planta_y_efecto([], _, _).
    mostrar_resultado_planta_y_efecto([[Planta, Efecto] | Resto], W, Y) :-
        send(W, display, text(Planta, left, normal), point(10, Y)),
        send(W, display, text(Efecto, left, normal), point(230, Y)),
        NewY is Y + 20,  % Incrementar la posición Y para la siguiente línea
        mostrar_resultado_planta_y_efecto(Resto, W, NewY).


%-------------NOMBRE COMUN Y CIENTF------------- 
metodo_listar_planta_y_nombre_cientifico:-
    new(D, dialog('Nombre Cientifico De Plantas')),
    send(D, size, size(500, 400)),
    send(D, colour, colour(black)),
    
    % Buscar todas las propiedades y sus efectos
    findall([Planta, NombreCientifico], nombre(Planta, NombreCientifico), Resultados),
    
    % Crear una ventana con scroll
    send(D, append, new(text('Nombre Comun:             Nombre cientifico:', center, bold))),
    new(W, window('Nombre Comun:        Nombre cientifico:', size(480, 400))),
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    % Mostrar los resultados en la ventana con scroll
    mostar_resultado_planta_nombreCientifico(Resultados, W, 10),
    
    % Agregar la ventana con scroll al diálogo
    send(D, append, W),
    
    % Abrir el diálogo
    send(D, open, point(1000, 200)).
    
    % Mostrar los resultados en la ventana aplicando recursividad.
    mostar_resultado_planta_nombreCientifico([], _, _).
    mostar_resultado_planta_nombreCientifico([[Planta, NombreCientifico] | Resto], W, Y) :-
        send(W, display, text(Planta, left, normal), point(10, Y)),
        send(W, display, text(NombreCientifico, left, normal), point(230, Y)),
        NewY is Y + 20,  % Incrementar la posición Y para la siguiente línea
        mostar_resultado_planta_nombreCientifico(Resto, W, NewY).

%-------------ORIGENES-------------
metodo_lista_origenes:-
    new(D, dialog('Origenes De Las Plantas')),
    send(D, size, size(300, 450)),
    send(D, colour, colour(black)),

    findall(Origen, origen(Origen), Origenes),
    
    send(D, display, text('Origenes: ', left, bold), point(10, 10)),
    new(W, window('Origenes', size(280, 410))),
    
    %Crear una ventana con scroll
    send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
    
    %Convertir la lista de enfermedades a string con salto de línea
    atomic_list_concat(Origenes, '\n', ListaOrigenes),
    
    %Mostrar los resultados de la lista en la ventana con scroll
    send(W, display, text(ListaOrigenes, left, normal), point(30, 10)),
    
    %Agregar la ventana con scroll al diálogo
    send(D, append, W),
    
    %Abrir el diálogo
    send(D, open, point(1000, 200)). 


%-------------TERMINO A BUSCAR-------------    
    metodo_significado_De_Terminos(Termino):-
        %DefineLaInstanciaDelNuevoFormulario
        new(D, dialog(Termino)),
        send(D, size, size(230,100)),
        send(D, colour, colour(black)),
        propiedad_efecto(Termino, Significado),
        send(D, open, point(500, 200)),
        %EtiquetasParaPresentacionDeDatos
        send(D, display, text('Termino: ', center, bold), point(20,15)),
        send(D, display, text(Termino, center, normal), point(35,30)),
        send(D, display, text('Significado: ', center, bold), point(20,45)), nl,
        send(D, display, text(Significado, center, normal), point(35,60)),
        nl.


%-------------BOTIQUIN-------------   
    metodo_botiquin :-
        new(D, dialog('Botiquin De Emergencias')),
        send(D, size, size(230, 400)),
        send(D, colour, colour(black)),
        findall(Planta, botiquin(Planta), Plantas),
        
        %Crear una ventana con scroll
        send(D, display, text('Plantas que siempre debes tener:', left, bold), point(10, 10)),
        new(W, window('Plantas que siempre debes tener: ', size(210, 370))),
        send(W, scrollbars, vertical),  % Agregar barra de scroll vertical
        
        %Convertir la lista de plantas a string con interlineado
        atomic_list_concat(Plantas, '\n', PlantasStr),
        
        %Mostrar los resultados de la lista en la ventana con scroll
        send(W, display, text(PlantasStr, left, normal), point(10, 0)),
        
        %Agregar la ventana con scroll al diálogo
        send(D, append, W),
        
        %Abrir el diálogo
        send(D, open, point(1000, 200)).





      


       






