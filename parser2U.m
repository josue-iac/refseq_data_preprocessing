function [ cc ] = parser2U ( file )
% Funcao para gerar 'proteoma' (multifasta com todas as proteinas concatenadas de determinado organismo )
%   Pode ser usada como pre-requisito para gerar arvore filogenetica.
%   17\04\2017
%   26/10/2021

%Declaração das variaveis iniciais
    Cfas=fastaread(file);
    org=1;
    cc={};
    n=length(Cfas);
    cont=2;

    cc{1,1}=char(Cfas(1).Header(strfind(Cfas(1).Header, ')_[')+3:end-1));        %salva o nome do primeiro organismo. colocar 982 (primeiro organismo) quando for n�o-cloroplasto
    aux=cc{1,1};
   for a=1:n-1
     %  if ~isempty(strfind(Cfas(a).Header, '(chloroplast)')) %manter esse if caso queira apenas cloroplasto, ou remova apenas a negacao(~)do isempty caso queira outros plastideos
             if boolean(strcmp(Cfas(a).Header(strfind(Cfas(a).Header, ')_[')+3:end-1), aux))     %se organismo computado
                cc{org,cont}=Cfas(a).Sequence;
                cont=cont+1;
            else
                cont=2;
                org=org+1;
                cc{org,1}=char(Cfas(a).Header(strfind(Cfas(a).Header, ')_[')+3:end-1));    %salva em uma linha nova da cell
                cc{org,cont}=Cfas(a).Sequence;                                 %salva a sequencia da primeira proteina na linha da cell correspondente ao organismo
                cont=cont+1;
                aux=cc{org,1};  
            end
       %end       
    end
     cc{org,cont}=Cfas(end).Sequence;                                                      %salva a ultima proteina do ultimo organismo

end