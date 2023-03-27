function [ fasta, pos ] = jRemove( fasta )
%   Localiza e remove todos os aminoacidos invalidos (J) da sequencia 
%   Retorna o fasta alterado como primeiro parametro (fasta),
%   E uma matriz com as coordenadas dos aminoacidos invalidos, sendo a
%   coluna 1 a sequencia x do fasta e a coluna 2 a posi��o n na sequencia x
%   onde o aminoacido J foi encontrado e removido. 
        
    n=length(fasta);
    cont=0;
    pos = [];
    for i=1:n
        j=sum(aa2int(fasta(i).Sequence)==0);
        if j>0
            naminoj=find(fasta(i).Sequence+0==74);%||fasta(i).Sequence+0==106);
            fasta(i).Sequence(naminoj)='';
            pos=[pos; i naminoj];
            cont=cont+1;
        end 
    end

    fprintf('%i aminoacidos não identificados -J- removidos com sucesso!\n', cont)
end


