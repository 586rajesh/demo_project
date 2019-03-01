public class TEST_class {
	Integer myDMLLimit = Limits.getDMLStatements();
    Integer cputime = Limits.getLimitCpuTime();
    Integer cputime1 = Limits.getLimitDmlRows();
    Integer cputime2 = Limits.getLimitDmlStatements();
    Integer cputime3 = Limits.getLimitEmailInvocations();
    Integer cputime4 = Limits.getLimitFutureCalls();
    Integer cputime5 = Limits.getLimitQueries();
    Integer cputime6 = Limits.getLimitSoslQueries();
    Integer cputime7 = Limits.getLimitHeapSize();
   public TEST_class()
   {
    system.Debug('cputime'+cputime+'LimitDmlRows'+cputime1+
                 'LimitDmlStatements'+cputime2+'LimitEmailInvocations'+cputime3+
                 'LimitFutureCalls'+cputime4+'LimitQueries'+cputime5+
                'LimitSoslQueries'+cputime6+'LimitHeapSize'+cputime5);   
   }
}