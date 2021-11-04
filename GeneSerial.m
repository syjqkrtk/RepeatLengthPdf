function serial = GeneSerial(num)

serial = zeros(47,8);

serial(1,:) = 'M73218  ';
serial(2,:) = 'D10330  ';
serial(3,:) = 'AF076239';
serial(4,:) = 'AF051830';
serial(5,:) = 'AF185822';
serial(6,:) = 'AF459438';
serial(7,:) = 'D11092  ';
serial(8,:) = 'L25595  ';
serial(9,:) = 'L08816  ';
serial(10,:) = 'D11093  ';
serial(11,:) = 'M94177  ';
serial(12,:) = 'M80581  ';
serial(13,:) = 'X98292  ';
serial(14,:) = 'AY230202';
serial(15,:) = 'AY204877';
serial(16,:) = 'M74506  ';
serial(17,:) = 'AB089824';
serial(18,:) = 'AB074918';
serial(19,:) = 'AB074920';
serial(20,:) = 'AF082843';
serial(21,:) = 'AF060668';
serial(22,:) = 'AF060669';
serial(23,:) = 'AB189070';
serial(24,:) = 'AB189071';
serial(25,:) = 'AB091394';
serial(26,:) = 'AB189072';
serial(27,:) = 'AP003430';
serial(28,:) = 'AB189073';
serial(29,:) = 'AB189074';
serial(30,:) = 'AB189075';
serial(31,:) = 'AB073912';
serial(32,:) = 'AF455784';
serial(33,:) = 'AY115488';
serial(34,:) = 'AB097812';
serial(35,:) = 'AB099347';
serial(36,:) = 'AB080575';
serial(37,:) = 'AB074915';
serial(38,:) = 'AB074917';
serial(39,:) = 'AB161717';
serial(40,:) = 'AB091395';
serial(41,:) = 'AB200239';
serial(42,:) = 'AB161718';
serial(43,:) = 'AB161719';
serial(44,:) = 'AB097811';
serial(45,:) = 'AY594199';
serial(46,:) = 'AJ272108';
serial(47,:) = 'AB108537';

serial = char(serial(num,:));

end
