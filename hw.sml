fun is_older (date1:int*int*int,date2: int*int*int)=
if #1 date1 <>  #1 date2
   then #1 date1 < #1 date2
   else if #2 date1 <> #2 date2
           then #2 date1 < #2 date2
           else #3 date1 < #3 date2

fun number_in_month (datelist: (int*int*int) list,month:int)=
   if null datelist
   then 0
   else
       let val tl_ans = number_in_month(tl(datelist),month)
       in
          if #2 (hd datelist) = month
          then tl_ans +1
          else tl_ans   
       end


fun number_in_months (datelist: (int*int*int) list,mlist:int list)=
    if null mlist
    then 0
    else 
	let val tl_ans = number_in_months(datelist,tl mlist)
        in
           tl_ans + number_in_month(datelist,hd mlist)
        end


fun dates_in_month (datelist: (int*int*int) list,month:int)=
   if null datelist
   then []
   else
       let val ans_list = dates_in_month(tl datelist,month)
       in
          if #2 (hd datelist) = month 
	  then 
            ( hd datelist)::ans_list
	  else
	     ans_list
       end



fun dates_in_months (datelist: (int*int*int) list,mlist:int list)=
   if null mlist
   then []
   else
       let val ans_list = dates_in_months(datelist,tl mlist)
       in
          ans_list @ dates_in_month(datelist,hd mlist)
       end



fun get_nth (slist: string list, n : int)=
   if null slist
   then "~1"   
   else if n <= 1 
   then hd slist
   else
       if null(tl slist)
       then hd slist
       else get_nth(tl slist,n-1)


fun date_to_string (date: int*int*int)=
let val mslist= ["January ","February ","March ","April ","May ", "June ",
		 "July ","August ","September ","October ","November ",
                 "December "]
in
   get_nth(mslist,#2 date)^
   (Int.toString (#3 date))^", "^
   (Int.toString (#1 date))
end


fun number_before_reaching_sum (sum:int,xl:int list)=
if null xl
then 0
else let val nextsum = sum - hd xl
      val ans= number_before_reaching_sum(nextsum, tl xl)
in
    if sum >  hd(xl)
    then ans + 1
    else ans
end


fun what_month (day : int)=
if day <= 0 orelse day >365
then ~1
else let val valid_days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
in
   number_before_reaching_sum(day,valid_days_in_month)+ 1
end


fun month_range (day_pair:int*int) =
if #1 day_pair > #2 day_pair
then []
else
let val ans = month_range (#1 day_pair +1 ,#2 day_pair)
in
    what_month (#1 day_pair) ::ans
end


fun oldest (datelist: (int*int*int) list)=
if null datelist
then NONE
else
    let val tl_ans = oldest (tl datelist)
    in
	if isSome tl_ans andalso is_older(valOf tl_ans, hd datelist)
        then tl_ans
        else SOME (hd datelist)
    end

fun number_in_months_challenge (datelist: (int*int*int) list,mlist:int list)= 
	let fun rmduplicate (xl:int list)=
		if  null xl  
		then []
                else
		    let fun remove (x:int, xl:int list)=
			    if null xl
			    then []	    
			    else if x = hd xl
				 then remove (x, tl xl)
				 else hd xl :: remove (x, tl xl)
		    in 
			hd (xl)::remove(hd xl,rmduplicate(tl xl))
		    end   
	in
           number_in_months(datelist,rmduplicate mlist)
        end


fun dates_in_months_challenge (datelist: (int*int*int) list,mlist:int list)= 
	let fun rmduplicate (xl:int list)=
		if  null xl  
		then []
                else
		    let fun remove (x:int, xl:int list)=
			    if null xl
			    then []	    
			    else if x = hd xl
				 then remove (x, tl xl)
				 else hd xl :: remove (x, tl xl)
		    in 
			hd (xl)::remove(hd xl,rmduplicate(tl xl))
		    end   
	in
           dates_in_months(datelist,rmduplicate mlist)
        end




fun reasonable_date (date: int*int*int) =
if #1 date > 0 andalso #2 date > 0 andalso #2 date < 13 andalso #3 date > 0
then
let
  fun is_leapyear (year :int)=
      (year mod 400) = 0  orelse 
           if (year mod 100) = 0
	   then false
	   else (year mod 4) = 0

  fun get_nth_int (xl: int  list, n : int)=
   if n = 1 
   then hd xl
   else get_nth_int(tl xl,n-1)

in
   if is_leapyear (#1 date)
   then
    let val valid_days_in_month = [31,29,31,30,31,30,31,31,30,31,30,31]
    in  get_nth_int(valid_days_in_month,#2 date) >= #3 date 
    end
   else 
    let val valid_days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
    in  get_nth_int(valid_days_in_month,#2 date) >= #3 date 
    end	
end
else false
