%2D matrix zig-zag scanning (used in JPEG)
a = rand(8);

right = true;
row = 1;
col = 1;
result = 0;
flag = false;

while(1)
   if(row ~= size(a, 1) || col ~= size(a, 2))
       disp(3);
       if(size(result, 1) == 1 && flag == false)
           result = a(row, col);
           flag = true;
       else
           result = [result, a(row, col)];
       end
       if(right)
          if(col < size(a, 2))
             col = col + 1;
             if(row > 1)
                row = row - 1;
             else
                right = false; 
             end
          else
             right = false;
             if(row < size(a, 1))
                row = row + 1;
             end
          end
       else
          if(row < size(a, 1))
             if(col > 1)
                col = col - 1; 
             else
                right = true;
             end
             row = row + 1;
          else
             if(row < size(a, 1))
                row = row + 1;
             end
             if(col < size(a, 2))
                col = col + 1; 
             end
             right = true;
          end
       end
   else
       disp(66);
      result = [result, a(row, col)];
      break; 
   end
end