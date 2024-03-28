/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_2(char*, char *);
extern void execute_384(char*, char *);
extern void execute_745(char*, char *);
extern void execute_746(char*, char *);
extern void execute_747(char*, char *);
extern void execute_748(char*, char *);
extern void execute_749(char*, char *);
extern void execute_719(char*, char *);
extern void execute_720(char*, char *);
extern void execute_721(char*, char *);
extern void execute_722(char*, char *);
extern void execute_723(char*, char *);
extern void execute_724(char*, char *);
extern void execute_725(char*, char *);
extern void execute_726(char*, char *);
extern void execute_727(char*, char *);
extern void execute_728(char*, char *);
extern void execute_729(char*, char *);
extern void execute_730(char*, char *);
extern void execute_731(char*, char *);
extern void execute_732(char*, char *);
extern void execute_733(char*, char *);
extern void execute_734(char*, char *);
extern void execute_735(char*, char *);
extern void execute_736(char*, char *);
extern void execute_737(char*, char *);
extern void execute_738(char*, char *);
extern void execute_739(char*, char *);
extern void execute_740(char*, char *);
extern void execute_741(char*, char *);
extern void execute_742(char*, char *);
extern void execute_743(char*, char *);
extern void execute_744(char*, char *);
extern void execute_421(char*, char *);
extern void execute_422(char*, char *);
extern void execute_423(char*, char *);
extern void execute_424(char*, char *);
extern void execute_425(char*, char *);
extern void execute_426(char*, char *);
extern void execute_427(char*, char *);
extern void execute_428(char*, char *);
extern void execute_429(char*, char *);
extern void execute_430(char*, char *);
extern void execute_431(char*, char *);
extern void execute_432(char*, char *);
extern void execute_433(char*, char *);
extern void execute_434(char*, char *);
extern void execute_435(char*, char *);
extern void execute_436(char*, char *);
extern void execute_437(char*, char *);
extern void execute_438(char*, char *);
extern void execute_439(char*, char *);
extern void execute_440(char*, char *);
extern void execute_441(char*, char *);
extern void execute_442(char*, char *);
extern void execute_443(char*, char *);
extern void execute_444(char*, char *);
extern void execute_445(char*, char *);
extern void execute_446(char*, char *);
extern void execute_447(char*, char *);
extern void execute_448(char*, char *);
extern void execute_449(char*, char *);
extern void execute_450(char*, char *);
extern void execute_451(char*, char *);
extern void execute_452(char*, char *);
extern void execute_389(char*, char *);
extern void execute_7(char*, char *);
extern void execute_102(char*, char *);
extern void execute_453(char*, char *);
extern void execute_104(char*, char *);
extern void execute_454(char*, char *);
extern void execute_455(char*, char *);
extern void execute_106(char*, char *);
extern void execute_110(char*, char *);
extern void execute_456(char*, char *);
extern void execute_457(char*, char *);
extern void execute_458(char*, char *);
extern void execute_459(char*, char *);
extern void execute_460(char*, char *);
extern void execute_461(char*, char *);
extern void execute_109(char*, char *);
extern void execute_112(char*, char *);
extern void execute_113(char*, char *);
extern void execute_462(char*, char *);
extern void execute_115(char*, char *);
extern void execute_117(char*, char *);
extern void execute_119(char*, char *);
extern void execute_386(char*, char *);
extern void execute_387(char*, char *);
extern void execute_388(char*, char *);
extern void execute_750(char*, char *);
extern void execute_751(char*, char *);
extern void execute_752(char*, char *);
extern void execute_753(char*, char *);
extern void execute_754(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[96] = {(funcp)execute_2, (funcp)execute_384, (funcp)execute_745, (funcp)execute_746, (funcp)execute_747, (funcp)execute_748, (funcp)execute_749, (funcp)execute_719, (funcp)execute_720, (funcp)execute_721, (funcp)execute_722, (funcp)execute_723, (funcp)execute_724, (funcp)execute_725, (funcp)execute_726, (funcp)execute_727, (funcp)execute_728, (funcp)execute_729, (funcp)execute_730, (funcp)execute_731, (funcp)execute_732, (funcp)execute_733, (funcp)execute_734, (funcp)execute_735, (funcp)execute_736, (funcp)execute_737, (funcp)execute_738, (funcp)execute_739, (funcp)execute_740, (funcp)execute_741, (funcp)execute_742, (funcp)execute_743, (funcp)execute_744, (funcp)execute_421, (funcp)execute_422, (funcp)execute_423, (funcp)execute_424, (funcp)execute_425, (funcp)execute_426, (funcp)execute_427, (funcp)execute_428, (funcp)execute_429, (funcp)execute_430, (funcp)execute_431, (funcp)execute_432, (funcp)execute_433, (funcp)execute_434, (funcp)execute_435, (funcp)execute_436, (funcp)execute_437, (funcp)execute_438, (funcp)execute_439, (funcp)execute_440, (funcp)execute_441, (funcp)execute_442, (funcp)execute_443, (funcp)execute_444, (funcp)execute_445, (funcp)execute_446, (funcp)execute_447, (funcp)execute_448, (funcp)execute_449, (funcp)execute_450, (funcp)execute_451, (funcp)execute_452, (funcp)execute_389, (funcp)execute_7, (funcp)execute_102, (funcp)execute_453, (funcp)execute_104, (funcp)execute_454, (funcp)execute_455, (funcp)execute_106, (funcp)execute_110, (funcp)execute_456, (funcp)execute_457, (funcp)execute_458, (funcp)execute_459, (funcp)execute_460, (funcp)execute_461, (funcp)execute_109, (funcp)execute_112, (funcp)execute_113, (funcp)execute_462, (funcp)execute_115, (funcp)execute_117, (funcp)execute_119, (funcp)execute_386, (funcp)execute_387, (funcp)execute_388, (funcp)execute_750, (funcp)execute_751, (funcp)execute_752, (funcp)execute_753, (funcp)execute_754, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 96;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/top_tb_behav/xsim.reloc",  (void **)funcTab, 96);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/top_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/top_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/top_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/top_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/top_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
