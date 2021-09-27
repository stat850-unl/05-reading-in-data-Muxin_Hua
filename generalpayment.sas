proc import datafile='cleaned_payment.csv' 
	out=payment
	DBMS = csv
	REPLACE;
	GETNAMES=YES;
	run;
proc print data=payment(obs=10);
run;

/*Look at some descriptive statistics for numerical variables */
proc means data=payment
	min p1 q1 mean median q3 p99 max;
	run;

/*As NJ has the most applicable manufacturer or applicable GPO making payment, I want to know how the recipients payment look like there.*/
proc univariate data=payment;
	where Recipient_State='NJ';
	title 'payment in NJ';
	var Total_Amount_of_Payment_USDolla;
	inset skewness kurtosis/ position=ne;
run;
