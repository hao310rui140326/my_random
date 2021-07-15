DUMP=NONE
LONG=NONE
CASE=apb_case0
UVM_INFO=UVM_LOW
MRATE=TDM
COMPILE_TIME = $(shell date +"%Y-%m-%d-%H-%M-%S")
SEED=0

GUI=NONE

verdi_path = /usr/synopsys/Verdi3_L-2016.06-1


ifeq ("$(GUI)","GUI")
GUI_OPTS += -gui=verdi
UVM_OPTS += +UVM_VERDI_TRACE="UVM_AWARE+RAL+HIER+COMPWAVE" +UVM_TR_RECORD +UVM_LOG_RECORD  
else
GUI_OPTS += "" 	
UVM_OPTS += ""
endif

VCS_OPTS +=  -full64 
VCS_OPTS +=  -cpp g++-4.8 -cc gcc-4.8  -LDFLAGS -Wl,--no-as-needed  
VCS_OPTS +=  -lca -kdb  
VCS_OPTS +=  -timescale=1ns/1ps   
VCS_OPTS +=  -P  $(verdi_path)/share/PLI/VCS/LINUX64/novas.tab   $(verdi_path)/share/PLI/VCS/LINUX64/pli.a 
VCS_OPTS +=  +vcs+lic+wait

VCS_OPTS +=  +define+UVM_NO_DEPRECATED

VCS_OPTS +=  -sverilog +verilog2001ext+.v  +lint=TFIPC-L  -ntb_opts uvm
##VCS_OPTS +=  -sverilog ../../uvm-1.1d/src/dpi/uvm_dpi.cc  -CFLAGS -DVCS  +verilog2001ext+.v  +lint=TFIPC-L  

VCS_OPTS +=  +define+UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTO  
VCS_OPTS +=  -debug_all  -cm_tgl mda 

CASE_OPTS +=  +ntb_random_seed=${SEED}
##CASE_OPTS +=  +ntb_random_seed_automatic

##VCS_OPTS += -debug_access+pp


ERR_OPTS += UVM_MAX_QUIT_COUNT=10,NO
COV_OPTS +=  -cm line+cond+fsm+tgl+branch+assert -cm_dir ./cov_info   -cm_hier  test.cfg   
CASE_OPTS += +UVM_TESTNAME=${CASE} +UVM_VERBOSITY=${UVM_INFO}  
CASE_OPTS +=  +UVM_TIMEOUT=10000000ns,YSE  


default:
	echo "\`define  $(DUMP)       "  >    define.v ; echo "\`define  $(LONG)       "  >>   define.v ;echo "\`define  $(UVM_INFO)       "  >>   define.v ;   vcs  $(VCS_OPTS)   -f ./tb.vc -top  tb_top  $(COV_OPTS)   $(UVM_OPTS)    -l vcs_com.log ; ./simv        $(CASE_OPTS)    $(COV_OPTS)  $(ERR_OPTS)     -l vcs_sim.log      $(GUI_OPTS)   $(UVM_OPTS)

verdi:
	 verdi -sv  -f ./tb.vc  -top tb_top &

verdi_simv:
	verdi  -elab simv.daidir/kdb  &
dve:
	dve -full64 -vpd vcdplus.vpd &

clean:
	rm -rf *simv*  *csrc   *~ verdiLog  novas*  ucli.key  *.vpd  *.fsdb  vc_hdrs.h  *.log    my_verdi   cov_report  DVEfiles   

cov:
	urg   -full64  -dir     ./*case*/cov_info.vdb    -report   ./cov_report   -format both
	firefox  ./cov_report/hierarchy.html  &
	
	
	
	
	
	

grep:
	grep "CASE"  ./*case*/vcs*.log

com_ini:
	gcc ini_mem.c
ini_mem:
	./a.out 0 1 5 1 1 w reg
	./a.out 0 2 6 2 1 a reg
	./a.out 1 3 7 3 10 a data

unix:
	dos2unix  run*
