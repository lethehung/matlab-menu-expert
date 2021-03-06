% function dist = editDist(inStr, dbStr, maxDist)


function dist = editDist(inStr, dbStr, maxDist)
    
    % Base Case 1: When either strings is at the null characters
    if ((numel(inStr)== 0) || (numel(dbStr)==0))
        dist = numel(inStr) + numel(dbStr);
        return;
    end
    
    % Base Case 2: Optimize recursive function with shortcircuiting
    if (maxDist < 0)
        dist = 0;
        return;
    end
    
    % When first character has a match, return the edit distance from the shorten string
    if (inStr(1) == dbStr(1))
        dist = editDist(inStr(2:end), dbStr(2:end), maxDist);
        return;
    end
    
    % When first character has no match, find the smallest edit distance of
    % 3 cases: 1. replace 2. add 3. delete
    d_rep = editDist(inStr(2:end), dbStr(2:end), maxDist-1);
    d_add = editDist(inStr, dbStr(2:end), maxDist-1);
    d_del = editDist(inStr(2:end), dbStr, maxDist-1);
    % m = findMin(d_rep, d_add, d_del);
    m = d_rep;
    if (d_add < m)
        m = d_add;
    end
    if (d_del < m)
        m = d_del;
    end
    dist = m+1;
    
end

