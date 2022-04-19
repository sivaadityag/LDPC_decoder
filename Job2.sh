#!/bin/bash
#SBATCH --job-name=LDPC2                                    
#SBATCH --time=12:00:00                                           
#SBATCH --ntasks=56                                            
#SBATCH --ntasks-per-node=28                                    
#SBATCH --mem=56G 
#SBATCH --output=output.%j


module load Python/3.6.6-intel-2018b

cd $SCRATCH
cd research/
source venv/bin/activate
cd LDPC_decoder/

python LDPC_HW2.py