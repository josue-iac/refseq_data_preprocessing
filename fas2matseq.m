function [ fas ] = fas2matseq ( Cfas )
% Funcao para gerar 'proteoma' (multifasta com todas as proteinas concatenadas de determinado organismo )
%   Pode ser usada como pre-requisito para gerar arvore filogenetica.
%   17\04\2017
%

%Declaração das variaveis iniciais
    fas={};
    n=length(Cfas);
  
   for a=1:n
       fas{a,1}=Cfas(a).Header;
       fas{a,2}=Cfas(a).Sequence;                                 %salva a sequencia da primeira proteina na linha da cell correspondente ao organismo
   end
end





