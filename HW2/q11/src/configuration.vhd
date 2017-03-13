configuration default_cfg of multiplier is
    for rtl
        for M1: multiplier
            use entity work.multiplier(multiplier_array);
        end for;
        for others: multiplier
            use: entity work.multiplier(multiplier_sequential);
        end for;
    end for;
end default_cfg;
