clc
clear all
close all
load NR_1_0_8.txt
B = NR_1_0_8;
z = 8;
N = size(B,1)*z;
M = size(B,2)*z;


fid = fopen('NR_1_0_8.alist', 'w');
% fid = fopen('dvbs2_ldpc_12.alist', 'w');
fprintf(fid, '%d %d\n', N, M);

row_non_zero_entry_number = sum(B>-1, 2).';
column_non_zero_entry_number = sum(B>-1, 1);

fprintf(fid, '%d %d\n', max(row_non_zero_entry_number), max(column_non_zero_entry_number));

for index = 1:N
  if mod(index-1,z)==0
      b_index = ((index-1)/z)+1;
      entry = row_non_zero_entry_number(b_index);
  end
  fprintf(fid, '%d ', entry);
end

fprintf(fid, '\n');

for index = 1:M
  if mod(index-1,z)==0
      b_index = ((index-1)/z)+1;
      entry = column_non_zero_entry_number(b_index);
  end
  fprintf(fid, '%d ',entry);
end

fprintf(fid, '\n');

for row_index = 1:N
  rem = mod(row_index-1,z);
  if rem == 0
      b_index = ((row_index-1)/z)+1;
      b_positions = find(B(b_index,:) > -1);
  end
  non_zero_entry_positions = (b_positions-1)*z + mod(B(b_index,b_positions)+rem,z)+1;

  for index = 1:max(row_non_zero_entry_number) % length(non_zero_entry_positions)
    if index <= length(non_zero_entry_positions)
      fprintf(fid, '%d ', non_zero_entry_positions(index));
    else
      fprintf(fid, '0 ');
    end
  end
  
  fprintf(fid, '\n');
end

for column_index = 1:M
  rem = mod(column_index-1,z);
  if rem == 0
      b_index = ((column_index-1)/z)+1;
      b_positions = find(B(:,b_index) > -1);
  end
  non_zero_entry_positions = (b_positions-1)*z + mod(B(b_positions,b_index)+rem,z)+1;

  for index = 1:max(column_non_zero_entry_number)
    if index <= length(non_zero_entry_positions)
      fprintf(fid, '%d ', non_zero_entry_positions(index));
    else
      fprintf(fid, '0 ');    
    end
  end

  fprintf(fid, '\n');
end
fclose(fid);
