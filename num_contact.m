A=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_Hydrophobic.2185.LEU.dat');
B=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_Hydrophobic.2225.TYR.dat');
C=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_Hydrophobic.2237.ILE.dat');
D=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_Hydrophobic.2239.TRP.dat');
E=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_Hydrophobic.2345.MET.dat');
F=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_Hydrophobic.2356.ILE.dat');
G=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_HBond.2187.LYS.dat');
H=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_HBond.2195.ASP.dat');
I=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_HBond.2240.VAL.dat');
J=importdata('44514208_4JT6_5_3_5/raw-data/PL-Contacts_HBond.2360.ASP.dat');
figure
  s(1)=subplot(10,1,1) 
  s(2)=subplot(10,1,2) 
  s(3)=subplot(10,1,3)  
  s(4)=subplot(10,1,4);
  s(5)=subplot(10,1,5) 
  s(6)=subplot(10,1,6) 
  s(7)=subplot(10,1,7)  
  s(8)=subplot(10,1,8)
  s(9)=subplot(10,1,9) 
  s(10)=subplot(10,1,10) 

 h1=stem(s(1),A(:,1)/200, A(:,2));
 h1.Marker='.';
 h1.MarkerSize=0.1;
 s(1).XLim=[3 5]
 s(1).YLim=[0 1]
 h1.LineWidth=1.0
 s(1).YLabel=text(2.5, 0.5, {'LEU 2185'}, 'FontSize', 10, 'Rotation',0)
 s(1).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(1).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(1).YTick=[]
 s(1).YTickLabel=[]
 set(s(1).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 
 h2=stem(s(2),G(:,1)/200, G(:,2)) 
 h2.Marker='.' ;
 h2.MarkerSize=0.1 
 s(2).XLim=[3 5]
 s(2).YLim=[0 1]
 h2.LineWidth=1.0 
 s(2).YLabel=text(2.5, 0.5, {'LYS 2187'}, 'FontSize', 10, 'Rotation',0)
 s(2).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(2).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(2).YTick=[]
 s(2).YTickLabel=[]
 set(s(2).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 
 
 h3=stem(s(3),H(:,1)/200, H(:,2));
 h3.Marker='.';
 h3.MarkerSize=0.1;
 h3.LineWidth=1.0;
 s(3).XLim=[3 5]
 s(3).YLim=[0 1]
 s(3).YLabel=text(2.5, 0.5, {'ASP 2195'}, 'FontSize', 10, 'Rotation',0)
 s(3).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(3).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(3).YTick=[]
 s(3).YTickLabel=[]
 set(s(3).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 
 
 h4=stem(s(4),B(:,1)/200, B(:,2));
 h4.Marker='.';
 h4.MarkerSize=0.1;
 h4.LineWidth=1.0;
 s(4).XLim=[3 5]
 s(4).YLim=[0 1]
 s(4).YLabel=text(2.5, 0.5, {'TYR 2225'}, 'FontSize', 10, 'Rotation',0)
 s(4).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(4).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(4).YTick=[]
 s(4).YTickLabel=[]
 set(s(4).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 


 h5=stem(s(5),C(:,1)/200, C(:,2));
 h5.Marker='.';
 h5.MarkerSize=0.1;
 h5.LineWidth=1.0;

 s(5).XLim=[3 5]
 s(5).YLim=[0 1]
 s(5).YLabel=text(2.5, 0.5, {'ILE 2237'}, 'FontSize', 10, 'Rotation',0)
 s(5).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(5).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(5).YTick=[]
 s(5).YTickLabel=[]
 set(s(5).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 
 
 
 
 
 
 h6=stem(s(6),D(:,1)/200, D(:,2));
 h6.Marker='.';
 h6.MarkerSize=0.1;
 h6.LineWidth=1.0;
 
 s(6).XLim=[3 5]
 s(6).YLim=[0 1]
 s(6).YLabel=text(2.5, 0.5, {'TRP 2239'}, 'FontSize', 10, 'Rotation',0)
 s(6).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(6).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(6).YTick=[]
 s(6).YTickLabel=[]
 set(s(6).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 
 
 h7=stem(s(7),I(:,1)/200, I(:,2))
 h7.Marker='.'
 h7.MarkerSize=0.1
 h7.LineWidth=1.0

 s(7).XLim=[3 5]
 s(7).YLim=[0 1]
 s(7).YLabel=text(2.5, 0.5, {'VAL 2240'}, 'FontSize', 10, 'Rotation',0)
 s(7).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(7).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(7).YTick=[]
 s(7).YTickLabel=[]
 set(s(7).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 
 

 h8=stem(s(8),E(:,1)/200, E(:,2))
 h8.Marker='.'
 h8.MarkerSize=0.1
 h8.LineWidth=1.0
 
 s(8).XLim=[3 5]
 s(8).YLim=[0 1]
 s(8).YLabel=text(2.5, 0.5, {'MET 2345'}, 'FontSize', 10, 'Rotation',0)
 s(8).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(8).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(8).YTick=[]
 s(8).YTickLabel=[]
 set(s(8).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);

 h9=stem(s(9),F(:,1)/200, F(:,2))
 h9.Marker='.'
 h9.MarkerSize=0.1
 h9.LineWidth=1.0
 
 s(9).XLim=[3 5]
 s(9).YLim=[0 1]
 s(9).YLabel=text(2.5, 0.5, {'ILE 2356'}, 'FontSize', 10, 'Rotation',0)
 s(9).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(9).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(9).YTick=[]
 s(9).YTickLabel=[]
 set(s(9).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
 
 h10=stem(s(10),J(:,1)/200, J(:,2))
 h10.Marker='.'
 h10.MarkerSize=0.1
 h10.LineWidth=1.0
 s(10).XLim=[3 5]
 s(10).YLim=[0 1]
 s(10).YLabel=text(2.5, 0.5, {'ASP 2360'}, 'FontSize', 10, 'Rotation',0)
 s(10).XTick=[3.0 3.5 4.0 4.5 5.0]
 s(10).XTickLabel= {'3.0','3.5','4.0','4.5','5.0'}
 s(10).YTick=[]
 s(10).YTickLabel=[]
 set(s(10).YLabel, 'Units', 'Normalized', 'Position', [-0.1, 0, 0]);
    xlabel('Timeline (ns)')
 print('44514208_HydrophobicHB_2','-depsc','-r300');
