#!/bin/bash

# design to substitute some outdated files for NanoAOD-tools
# Remove some outdated files to save IO for crab jobs
echo Initiation

export WORKING_PATH="$CMSSW_BASE/src/PhysicsTools/NanoAODTools/python/postprocessing/"
echo $WORKING_PATH

echo Updating pileup
#cp $WORKING_PATH/analysis/others/for_pileup/mcPileupUL2017.root $WORKING_PATH/data/pileup/
cp -v $WORKING_PATH/analysis/others/for_pileup/mcPileupUL2018.root $WORKING_PATH/data/pileup/
#cp $WORKING_PATH/analysis/others/for_pileup/PileupHistogram-goldenJSON-13tev-UL2017-99bins_withVar.root $WORKING_PATH/data/pileup/
cp -v $WORKING_PATH/analysis/others/for_pileup/PileupHistogram-goldenJSON-13tev-UL2018-99bins_withVar.root $WORKING_PATH/data/pileup/
cp -v $WORKING_PATH/analysis/others/for_pileup/puWeightProducer.py $WORKING_PATH/modules/common/

#echo Updating prefiring correction
cp $WORKING_PATH/analysis/others/for_prefiring/*.root $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/prefire_maps/
cp $WORKING_PATH/analysis/others/for_prefiring/PrefireCorr.py $WORKING_PATH/modules/common/

echo Updating JME correction
cp -v $WORKING_PATH/analysis/others/for_jme/*UL18*.tar.gz $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/jme/
cp -v $WORKING_PATH/analysis/others/for_jme/jetmetHelperRun2.py $WORKING_PATH/modules/jme

echo Updating BJet related
cp -v $WORKING_PATH/analysis/others/for_btv/btagSFProducer.py $WORKING_PATH/modules/btv
cp -v $WORKING_PATH/analysis/others/for_btv/*UL18*.csv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/btagSF/

echo Cleaning
rm -rv $WORKING_PATH/analysis/others/
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/jme/Autumn18_*.tgz
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/jme/Fall17_*.tgz
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/jme/Spring16_*.tgz
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/jme/Summer16_*.tgz
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/data/jme/*UL17*
rm -rv $WORKING_PATH/data/roccor*
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/python/postprocessing/analysis/crab/configs_v9/2018/UL2018NanoAODv9_relaxed.txt
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/python/postprocessing/analysis/crab/configs_v9/2018/UL2018NanoAODv9.txt
rm -rv $CMSSW_BASE/src/PhysicsTools/NanoAODTools/python/postprocessing/analysis/crab/configs_v9/2018/list_input_sample.py

echo redo scram
cd $CMSSW_BASE/src
scram b -j8

echo "Initiation Done"
cd $CMSSW_BASE/src/PhysicsTools/NanoAODTools/python/postprocessing/analysis
