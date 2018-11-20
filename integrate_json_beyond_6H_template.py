
####
### template  to extract  up/dn-reguilated genes for each cell-type(9)(duration=6H, dose=10UM fixed) from json files downloaded from BROAD
####

import pandas as pd


## collect json data

df_data = pd.DataFrame()
for i in range (0,24):
    data = pd.read_json("all.list3." + str(i)+ ".json")
    df_data = df_data.append(data)



## BRD-K81418486 has so many data and I needed to separate into 3 files to download from BROAD INST.

for i in range (1,4):
    data = pd.read_json("BRD-K81418486." +str(i) + ".json")
    df_data = df_data.append(data)



## make dictionary for prid and geneid

data2 = pd.read_csv("lm_geneid_prid.all.nonredun.1to1.txt", header=None,delim_whitespace=True)

data2 = data2.rename(columns = {

    0:'geneid',
    1:'prid',
})

data2_dict = data2.set_index('prid')['geneid'].to_dict()


## extract  up/dn-reguilated lm_geneswith ( |z| > 2 )

HEPG2_10=df_data[(df_data.cell_id=="HEPG2") & (df_data.pert_idose=="10 µM") & (df_data.pert_itime=="6 h")]



pertuniq=HEPG2_10.pert_id.unique()

df_up = pd.DataFrame()
df_dn = pd.DataFrame()

for i in range(0, len(pertuniq)): 
    HEPG2_10_pert=HEPG2_10[HEPG2_10.pert_id==pertuniq[i]]

    if len(HEPG2_10.distil_cc_q75) > 1:
        HEPG2_10_pert_q75=HEPG2_10_pert.distil_cc_q75.max() 
        HEPG2_10_pert_q75=HEPG2_10_pert[HEPG2_10_pert.distil_cc_q75==HEPG2_10_pert_q75]
        if len(HEPG2_10_pert_q75.distil_ss) > 1:
            HEPG2_10_pert_ss=HEPG2_10_pert_q75.distil_ss.max() 
            HEPG2_10_pert_best=HEPG2_10_pert_q75[HEPG2_10_pert_q75.distil_ss==HEPG2_10_pert_ss]
        elif len(HEPG2_10_pert_q75.distil_ss) == 1:
            HEPG2_10_pert_best=HEPG2_10_pert_q75
        else:
            print('something wrong!')
    elif len(HEPG2_10_pert.distil_cc_q75) == 1:
        HEPG2_10_pert_best=HEPG2_10_pert
    else:
        print('something wrong!')

    ngenes_dn=HEPG2_10_pert_best.ngenes_modulated_dn_lm.values[0]
    ngenes_up=HEPG2_10_pert_best.ngenes_modulated_up_lm.values[0]-1

    up_lm50_n=HEPG2_10_pert_best.up50_lm.values[0][0:(ngenes_up)]
    dn_lm50_n=HEPG2_10_pert_best.dn50_lm.values[0][-(ngenes_dn):]
    up_lm50_n_s= pd.Series(up_lm50_n)
    dn_lm50_n_s= pd.Series(dn_lm50_n)
    
    up_lm50_n_geneid = up_lm50_n_s.map(data2_dict)
    dn_lm50_n_geneid = dn_lm50_n_s.map(data2_dict)
    
    up_genes = pd.DataFrame({'labels': pertuniq[i] , 'ngenes_up': up_lm50_n_geneid})
    dn_genes = pd.DataFrame({'labels': pertuniq[i] , 'ngenes_dn': dn_lm50_n_geneid})
    df_up=df_up.append(up_genes)
    df_dn=df_dn.append(dn_genes)

df_up.to_csv("HEPG2_10_6H_results_up.txt", sep=" ", header=False, index=False)
df_dn.to_csv("HEPG2_10_6H_results_dn.txt", sep=" ", header=False, index=False)
