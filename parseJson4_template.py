# coding: utf-8

# In[1]:

import pandas as pd

data = pd.read_json("all.list.json")

data2 = pd.read_csv("lm_geneid_prid.all.nonredun.1to1.txt", header=None,delim_whitespace=True)

data2 = data2.rename(columns = {

    0:'geneid',
    1:'prid',
})

data2_dict = data2.set_index('prid')['geneid'].to_dict()

MCF7_10=data[(data.cell_id=="MCF7") & (data.pert_idose=="10 µM")]

pertuniq=MCF7_10.pert_id.unique()

df_up = pd.DataFrame()
df_dn = pd.DataFrame()

for i in range(0, len(pertuniq)): 
    MCF7_10_pert=MCF7_10[MCF7_10.pert_id==pertuniq[i]]

    if len(MCF7_10.distil_cc_q75) > 1:
        MCF7_10_pert_q75=MCF7_10_pert.distil_cc_q75.max() 
        MCF7_10_pert_q75=MCF7_10_pert[MCF7_10_pert.distil_cc_q75==MCF7_10_pert_q75]
        if len(MCF7_10_pert_q75.distil_ss) > 1:
            MCF7_10_pert_ss=MCF7_10_pert_q75.distil_ss.max() 
            MCF7_10_pert_best=MCF7_10_pert_q75[MCF7_10_pert_q75.distil_ss==MCF7_10_pert_ss]
        elif len(MCF7_10_pert_q75.distil_ss) == 1:
            MCF7_10_pert_best=MCF7_10_pert_q75
        else:
            print('something wrong!')
    elif len(MCF7_10_pert.distil_cc_q75) == 1:
        MCF7_10_pert_best=MCF7_10_pert
    else:
        print('something wrong!')

    ngenes_dn=MCF7_10_pert_best.ngenes_modulated_dn_lm.values[0]
    ngenes_up=MCF7_10_pert_best.ngenes_modulated_up_lm.values[0]-1

    up_lm50_n=MCF7_10_pert_best.up50_lm.values[0][0:(ngenes_up)]
    dn_lm50_n=MCF7_10_pert_best.dn50_lm.values[0][-(ngenes_dn):]

    up_lm50_n_s= pd.Series(up_lm50_n)
    dn_lm50_n_s= pd.Series(dn_lm50_n)
    
    up_lm50_n_geneid = up_lm50_n_s.map(data2_dict)
    dn_lm50_n_geneid = dn_lm50_n_s.map(data2_dict)
    
    up_genes = pd.DataFrame({'labels': pertuniq[i] , 'ngenes_up': up_lm50_n_geneid})
    dn_genes = pd.DataFrame({'labels': pertuniq[i] , 'ngenes_dn': dn_lm50_n_geneid})
    df_up=df_up.append(up_genes)
    df_dn=df_dn.append(dn_genes)

df_up.to_csv("MCF7_10_results_up.txt", sep=" ", header=False, index=False)
df_dn.to_csv("MCF7_10_results_dn.txt", sep=" ", header=False, index=False)
