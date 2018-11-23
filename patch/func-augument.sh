awk '{n=split($11, str, ";"); for(i=1;i<=n;i++) { m=split(str[i], str2, "("); prot=str2[1]; if (prot in protlist == 0) { protlist[prot] = 1; } else { protlist[prot] = protlist[prot]+1; } }} END { for(prot in protlist) print prot "\t" protlist[prot]; }' FS="\t" Bst45.fgs.tsv.0.01.tsv > fgs-id.list

awk 'FNR==NR{idlist[$1]; next} { id=$2; sys=$4; if(sys in subsystem_all) { subsystem_all[sys] = subsystem_all[sys] + 1; if(id in idlist) subsystem_identified[sys] = subsystem_identified[sys]+1; } else { subsystem_all[sys] = 1; if(id in idlist) subsystem_identified[sys]=1;}} END { for (sys in subsystem_identified) print sys "\t" subsystem_identified[sys] "\t" subsystem_all[sys]; }' FS="\t" fgs-id.list FS="\t" Bst45.contig.fgs.subsystem > subsystem-id.list