% planta
planta('Uña de gato').
planta(valeriana).
planta(zarzaparrilla).
planta(zabila).


nombre_cientifico('Uña de gato','Uncaria tomentosa').
nombre_cientifico(valeriana,'valeriana procera').
nombre_cientifico(zarzaparrilla,'Smilax aspera').
nombre_cientifico(zabila,'Aloe vera').

%Uña de gato
propiedad(diabetes).
propiedad(artritis).
propiedad(inflamaciones).
propiedad(blenorragia).
propiedad(males_prostata).
propiedad(tumores_cancerosos).
propiedad(estudio_sida).


%zarzaparrilla
propiedad(purifica_sangre).
propiedad(granos_acne).
propiedad(eczema).
propiedad(ronchas).
propiedad(urticarias).
propiedad(sangre_mala).
propiedad(sifilis).


%valeriana
propiedad(trastornos_nerviosos).
propiedad(neuralgias).
propiedad(jaquecas).
propiedad(insomnio).
propiedad(pesadillas).
propiedad(epilepsia).
propiedad(agotamiento).
propiedad(calambre_estomacal).
propiedad(diabetes_nerviosa).
propiedad(sedativa).
propiedad(sudorifica).
propiedad(antiespasmodica).

%zabila

propiedad(alivia_llagas).
propiedad(alivia_heridas).
propiedad(alivia_gonorrea).
propiedad(alivia_blenorragia).
propiedad(alivia_ulceras_renales).
propiedad(alivia_ulceras_vejiga).
propiedad(alivia_resfriados).
propiedad(alivia_tos).
propiedad(alivia_indigestiones).
propiedad(alivia_cancer_lengua).
propiedad(alivia_herpes).
propiedad(alivia_eczemas).
propiedad(alivia_jarabe).



%Uña de gato
alivia('Uña de gato', diabetes).
alivia('Uña de gato',artritis).
alivia('Uña de gato',inflamaciones).
alivia('Uña de gato',blenorragia).
alivia('Uña de gato',males_prostata).
alivia('Uña de gato',tumores_cancerosos).
alivia('Uña de gato',estudio_sida).


%valeriana
alivia(valeriana,trastornos_nerviosos).
alivia(valeriana,jaquecas).
alivia(valeriana,neuralgias).
alivia(valeriana,insomnio).
alivia(valeriana,pesadillas).
alivia(valeriana,epilepsia).
alivia(valeriana,agotamiento).
alivia(valeriana,calambre_estomacal).
alivia(valeriana,diabetes_nerviosa).
alivia(valeriana,sedativa).
alivia(valeriana,sudorifica).
alivia(valeriana,antiespasmodica).

%zarzaparrilla
alivia(zarzaparrilla, purifica_sangre).
alivia(zarzaparrilla, granos_acne).
alivia(zarzaparrilla, eczema).
alivia(zarzaparrilla, ronchas).
alivia(zarzaparrilla, urticarias).
alivia(zarzaparrilla, sangre_mala).
alivia(zarzaparrilla, sifilis).

%zabila
alivia(zabila, alivia_llagas).
alivia(zabila, alivia_heridas).
alivia(zabila, alivia_gonorrea).
alivia(zabila, alivia_blenorragia).
alivia(zabila, alivia_ulceras_renales).
alivia(zabila, alivia_ulceras_vejiga).
alivia(zabila, alivia_resfriados).
alivia(zabila, alivia_tos).
alivia(zabila, alivia_indigestiones).
alivia(zabila, alivia_cancer_lengua).
alivia(zabila, alivia_herpes).
alivia(zabila, alivia_eczemas).
alivia(zabila, alivia_jarabe).


% Método Uña de Gato
forma_uso('Uña de gato', diabetes, 'Infusión').
forma_uso('Uña de gato', artritis, 'Infusión').
forma_uso('Uña de gato', inflamaciones, 'Aplicación directa').
forma_uso('Uña de gato', blenorragia, 'Infusión').
forma_uso('Uña de gato', males_prostata, 'Infusión').
forma_uso('Uña de gato', tumores_cancerosos, 'Infusión').
forma_uso('Uña de gato', estudio_sida, 'Infusión').

% Método Valeriana
forma_uso(valeriana, trastornos_nerviosos, 'Infusión').
forma_uso(valeriana, neuralgias, 'Infusión').
forma_uso(valeriana, jaquecas, 'Infusión').
forma_uso(valeriana, insomnio, 'Infusión').
forma_uso(valeriana, pesadillas, 'Infusión').
forma_uso(valeriana, epilepsia, 'Infusión').
forma_uso(valeriana, agotamiento, 'Infusión').
forma_uso(valeriana, calambre_estomacal, 'Infusión').
forma_uso(valeriana, diabetes_nerviosa, 'Infusión').
forma_uso(valeriana, sedativa, 'Infusión').
forma_uso(valeriana, sudorifica, 'Infusión').
forma_uso(valeriana, antiespasmodica, 'Infusión').

% Método Zarzaparrilla
forma_uso(zarzaparrilla, 'purificar la sangre', 'Infusión').
forma_uso(zarzaparrilla, granos, 'Infusión').
forma_uso(zarzaparrilla, eczema, 'Infusión').
forma_uso(zarzaparrilla, ronchas, 'Infusión').
forma_uso(zarzaparrilla, urticarias, 'Infusión').
forma_uso(zarzaparrilla, 'sangre mala', 'Infusión').
forma_uso(zarzaparrilla, sifilis, 'Infusión').

% Método Zábila (Aloe Vera)
forma_uso(zabila, alivia_llagas, 'Aplicación directa').
forma_uso(zabila, alivia_heridas, 'Aplicación directa').
forma_uso(zabila, alivia_gonorrea, 'Infusión').
forma_uso(zabila, alivia_blenorragia, 'Infusión').
forma_uso(zabila, alivia_ulceras_renales, 'Infusión').
forma_uso(zabila, alivia_ulceras_vejiga, 'Infusión').
forma_uso(zabila, alivia_resfriados, 'Infusión').
forma_uso(zabila, alivia_tos, 'Infusión').
forma_uso(zabila, alivia_indigestiones, 'Infusión').
forma_uso(zabila, alivia_cancer_lengua, 'Infusión').
forma_uso(zabila, alivia_herpes, 'Jarabe').
forma_uso(zabila, alivia_eczemas, 'Jarabe').
forma_uso(zabila, alivia_jarabe, 'Jarabe').

tratamiento_planta(Planta, Metodo, Propiedad) :-
    alivia(Planta, Propiedad),
    forma_uso(Planta, Propiedad, Metodo).

propiedad_planta(Propiedad, Planta, Metodo) :-
    alivia(Planta, Propiedad),
    forma_uso(Planta, Propiedad, Metodo).

