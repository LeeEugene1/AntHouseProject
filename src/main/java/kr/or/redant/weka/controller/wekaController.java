package kr.or.redant.weka.controller;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.weka.service.IWekaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.functions.RBFNetwork;
import weka.core.Attribute;
import weka.core.FastVector;
import weka.core.Instance;
import weka.core.Instances;
import weka.experiment.ResultListener;

@Controller
@RequestMapping("/weka/")
public class wekaController {
    @Autowired
    private IWekaService service;
   
    private List<DailyPriceVO> wekaList = null;
    private String buyDate = null; 
    private String buyPrice = null; 
    private String tempRate = null; 
    private String weather = null; 
    private double resultPrice1; 
    private double resultPrice3; 
    private double resultPrice6; 
    private double resultPrice9; 
    private Evaluation evaluation;
    
    
    // 계산 -> 등락율 / 종목 코드 / 종목 명 ->
    
	@RequestMapping("wekaList")
	@ResponseBody
	public ModelAndView wekaList(Map<String, String> params, ModelAndView model,String p_buyDate, String  p_buyPrice, String p_code) throws Exception{
		// 받을 데이터
		params.put("stock_item_code", "A"+p_code);
		this.buyDate = p_buyDate;
		this.buyPrice = p_buyPrice;
		this.tempRate = "등락율";
//		this.tempRate = "종가";
		//
		
		this.wekaList = this.service.wekaList(params);
		
//		wekaController wekaTut = new wekaController();
		if(tempRate == "등락율"){
			executeWekaTutorial1();
		}else if(tempRate == "종가"){
//			executeWekaTutorial2();
		}
		model.addObject("resultPrice1", resultPrice1);
		model.addObject("resultPrice3", resultPrice3);
		model.addObject("resultPrice6",resultPrice6);
		model.addObject("resultPrice9",resultPrice9);
		model.addObject("evaluation",evaluation.toSummaryString());
		model.setViewName("jsonConvertView");
		return model;
		
	}
	
	private void executeWekaTutorial1() throws Exception {
        FastVector allAttributes = createAttributes1();
        Instances learningDataset = createLearningDataSet1(allAttributes);
        Classifier predictiveModel = learnPredictiveModel( learningDataset);
        evaluation = evaluatePredictiveModel(predictiveModel,  learningDataset);
        System.out.println(evaluation);
        predictUnknownCases1(learningDataset,predictiveModel);
   
//        plotData(learningDataset, predictiveModel);
    }
	
	
	private FastVector createAttributes1() {
        //create the numeric attribute Age
        Attribute ageAttribute = new Attribute("월");
        //create the nominal attribute Gender
        FastVector genderAttributeValues = new FastVector(2);
        genderAttributeValues.addElement("봄");
        genderAttributeValues.addElement("여름");
        genderAttributeValues.addElement("가을");
        genderAttributeValues.addElement("겨울");
        Attribute genderAttribute = new Attribute("계절", genderAttributeValues);
        //create the numLogins attribute
        Attribute numLoginsAttribute = new Attribute("등락율");
        FastVector allAttributes = new FastVector(8);
        allAttributes.addElement(ageAttribute);
        allAttributes.addElement(genderAttribute);
        allAttributes.addElement(numLoginsAttribute);
        return allAttributes;
    }
	
	
	 public Instances createLearningDataSet1(FastVector allAttributes) {
	        Instances trainingDataSet = 
	            new Instances("wekaTutorial", allAttributes, 8); 
	        trainingDataSet.setClassIndex(2);
	        // list -> 5년치 들어있고
	        //(if) 19년 01월 01일 > bs_date && 19년 03월 31일 < bs_date
	        
	        for(int i=0; i<wekaList.size(); i++){
	        	if(wekaList.get(i).getBs_date().substring(2,4).equals("19")){
		        	if(wekaList.get(i).getBs_date().substring(5,7).equals("03") || wekaList.get(i).getBs_date().substring(5,7).equals("04") || wekaList.get(i).getBs_date().substring(5,7).equals("05")){
		        		addInstance(trainingDataSet, 1.,"봄", Double.parseDouble(wekaList.get(i).getFluctuation()));
			        }else if(wekaList.get(i).getBs_date().substring(5,7).equals("06") || wekaList.get(i).getBs_date().substring(5,7).equals("07") || wekaList.get(i).getBs_date().substring(5,7).equals("08")){
		        		addInstance(trainingDataSet, 2.,"여름", Double.parseDouble(wekaList.get(i).getFluctuation()));
			        }else if(wekaList.get(i).getBs_date().substring(5,7).equals("09") || wekaList.get(i).getBs_date().substring(5,7).equals("10") || wekaList.get(i).getBs_date().substring(5,7).equals("11")){
		        		addInstance(trainingDataSet, 3.,"가을", Double.parseDouble(wekaList.get(i).getFluctuation()));
			        }else{
			        	addInstance(trainingDataSet, 4.,"겨울", Double.parseDouble(wekaList.get(i).getFluctuation()));
			        }
	        	}
	        }
	        
	        return trainingDataSet;
	    }
	 
    
    
    private void predictUnknownCases1(Instances learningDataset, Classifier predictiveModel) 
            throws Exception {
            Instance testMaleInstance1 = 
                createInstance(learningDataset,1., "봄", 0) ;
            Instance testMaleInstance2 = 
                createInstance(learningDataset,2., "여름", 0) ;
            Instance testMaleInstance3 = 
            		createInstance(learningDataset,3., "가을", 0) ;
            Instance testMaleInstance4 = 
            		createInstance(learningDataset,4., "겨울", 0) ;
            double testMaleInstance11 = 
                predictiveModel.classifyInstance(testMaleInstance1);
            double testMaleInstance22 = 
                predictiveModel.classifyInstance(testMaleInstance2);
            double testMaleInstance33 = 
            		predictiveModel.classifyInstance(testMaleInstance3);
            double testMaleInstance44 = 
            		predictiveModel.classifyInstance(testMaleInstance4);
            if(this.buyDate.substring(4, 6).equals("03")|this.buyDate.substring(4, 6).equals("04")|this.buyDate.substring(4, 6).equals("05")){
            	this.weather = "봄";
            	resultPrice1 = Double.parseDouble(this.buyPrice);
            	resultPrice3 = resultPrice1 + (resultPrice1 * testMaleInstance22);
            	resultPrice6 = resultPrice3 + (resultPrice3 * testMaleInstance33);
            	resultPrice9 = resultPrice6 + (resultPrice6 * testMaleInstance44);
            }else if(this.buyDate.substring(4, 6).equals("06")|this.buyDate.substring(4, 6).equals("07")|this.buyDate.substring(4, 6).equals("08")){
            	this.weather = "여름";
            	resultPrice1 = Double.parseDouble(this.buyPrice);
            	resultPrice3 = resultPrice1 + (resultPrice1 * testMaleInstance33);
            	resultPrice6 = resultPrice3 + (resultPrice3 * testMaleInstance44);
            	resultPrice9 = resultPrice6 + (resultPrice6 * testMaleInstance11);
            }else if(this.buyDate.substring(4, 6).equals("09")|this.buyDate.substring(4, 6).equals("10")|this.buyDate.substring(4, 6).equals("11")){
            	this.weather = "가을";
            	resultPrice1 = Double.parseDouble(this.buyPrice);
            	resultPrice3 = resultPrice1 + (resultPrice1 * testMaleInstance44);
            	resultPrice6 = resultPrice3 + (resultPrice3 * testMaleInstance11);
            	resultPrice9 = resultPrice6 + (resultPrice6 * testMaleInstance22);
            }else if(this.buyDate.substring(4, 6).equals("12")|this.buyDate.substring(4, 6).equals("01")|this.buyDate.substring(4, 6).equals("02")){
            	this.weather = "겨울";
            	resultPrice1 = Double.parseDouble(this.buyPrice);
            	resultPrice3 = resultPrice1 + (resultPrice1 * testMaleInstance11);
            	resultPrice6 = resultPrice3 + (resultPrice3 * testMaleInstance22);
            	resultPrice9 = resultPrice6 + (resultPrice6 * testMaleInstance33);
            }
            System.out.println("Predicted number of logins [계절]: ");
            System.out.println("\t봄 = " + testMaleInstance11);
            System.out.println("\t여름 = " + testMaleInstance22);
            System.out.println("\t가을 = " + testMaleInstance33);
            System.out.println("\t겨울 = " + testMaleInstance44);
            System.out.println("===========================================");
            System.out.println("1개월 후 예상가격 = " + resultPrice1);
            System.out.println("3개월 후 예상가격 = " + resultPrice3);
            System.out.println("6개월 후 예상가격 = " + resultPrice6);
            System.out.println("9개월 후 예상가격 = " + resultPrice9);
            
        }
    
    private void addInstance(Instances trainingDataSet, 
                             double age, 
                             String gender,
                             double numLogins)
    {        
        Instance instance = createInstance(trainingDataSet,age, gender,numLogins);
        trainingDataSet.add(instance);
    }
    
    private Instance createInstance(Instances associatedDataSet,
            double age, String gender, double numLogins) {
        // Create empty instance with three attribute values
    	Instance instance = null;
		instance = new weka.core.DenseInstance(3);
//        Instance instance = new Instance(3);
        instance.setDataset(associatedDataSet);
        instance.setValue(0, age);
        instance.setValue(1, gender);
        instance.setValue(2, numLogins);
        return instance;
    }
    
    private Classifier learnPredictiveModel(Instances learningDataset) throws Exception {
       Classifier classifier = getClassifier();
       classifier.buildClassifier(learningDataset);
       return classifier;
    }
    
    private Classifier getClassifier() {
        RBFNetwork rbfLearner = new RBFNetwork();
        rbfLearner.setNumClusters(4);
        return rbfLearner;
    }
    
    private Evaluation evaluatePredictiveModel(Classifier classifier, Instances learningDataset) throws Exception {
        Evaluation learningSetEvaluation = new Evaluation(learningDataset);
        learningSetEvaluation.evaluateModel(classifier, learningDataset);
        return learningSetEvaluation;
    }

    private void plotData(Instances learningDataset, Classifier predictiveModel) throws Exception {
        for (int i = 20;  i <= 40; i ++) {
            Instance testMaleInstance = createInstance(learningDataset,i, "male", 0) ;
            Instance testFemaleInstance = createInstance(learningDataset,i, "female", 0) ;
            System.out.println(i + ",male," + predictiveModel.classifyInstance(testMaleInstance));
            System.out.println(i + ",female," + predictiveModel.classifyInstance(testFemaleInstance));
        }
    }
}


