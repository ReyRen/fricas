ACPLOT.spad: $(srcdir)/acplot.spad
	$(unpack_file) ")abbrev domain ACPLOT PlaneAlgebraicCurvePlot" < $< > $@

REALSOLV.spad: $(srcdir)/acplot.spad
	$(unpack_file) ")abbrev package REALSOLV RealSolvePackage" < $< > $@

FLAGG2.spad: $(srcdir)/aggcat2.spad
	$(unpack_file) ")abbrev package FLAGG2 FiniteLinearAggregateFunctions2" < $< > $@

FSAGG2.spad: $(srcdir)/aggcat2.spad
	$(unpack_file) ")abbrev package FSAGG2 FiniteSetAggregateFunctions2" < $< > $@

A1AGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category A1AGG OneDimensionalArrayAggregate" < $< > $@

AGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category AGG Aggregate" < $< > $@

ALAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category ALAGG AssociationListAggregate" < $< > $@

BGAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category BGAGG BagAggregate" < $< > $@

BRAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category BRAGG BinaryRecursiveAggregate" < $< > $@

BTAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category BTAGG BitAggregate" < $< > $@

CLAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category CLAGG Collection" < $< > $@

DIAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category DIAGG Dictionary" < $< > $@

DIOPS.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category DIOPS DictionaryOperations" < $< > $@

DLAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category DLAGG DoublyLinkedAggregate" < $< > $@

DQAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category DQAGG DequeueAggregate" < $< > $@

ELAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category ELAGG ExtensibleLinearAggregate" < $< > $@

ELTAB.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category ELTAB Eltable" < $< > $@

ELTAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category ELTAGG EltableAggregate" < $< > $@

FLAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category FLAGG FiniteLinearAggregate" < $< > $@

FSAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category FSAGG FiniteSetAggregate" < $< > $@

HOAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category HOAGG HomogeneousAggregate" < $< > $@

IXAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category IXAGG IndexedAggregate" < $< > $@

KDAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category KDAGG KeyedDictionary" < $< > $@

LNAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category LNAGG LinearAggregate" < $< > $@

LSAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category LSAGG ListAggregate" < $< > $@

MDAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category MDAGG MultiDictionary" < $< > $@

MSETAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category MSETAGG MultisetAggregate" < $< > $@

OMSAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category OMSAGG OrderedMultisetAggregate" < $< > $@

PRQAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category PRQAGG PriorityQueueAggregate" < $< > $@

QUAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category QUAGG QueueAggregate" < $< > $@

RCAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category RCAGG RecursiveAggregate" < $< > $@

SETAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category SETAGG SetAggregate" < $< > $@

SKAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category SKAGG StackAggregate" < $< > $@

SRAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category SRAGG StringAggregate" < $< > $@

STAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category STAGG StreamAggregate" < $< > $@

TBAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category TBAGG TableAggregate" < $< > $@

URAGG.spad: $(srcdir)/aggcat.spad
	$(unpack_file) ")abbrev category URAGG UnaryRecursiveAggregate" < $< > $@

FINRALG.spad: $(srcdir)/algcat.spad
	$(unpack_file) ")abbrev category FINRALG FiniteRankAlgebra" < $< > $@

FRAMALG.spad: $(srcdir)/algcat.spad
	$(unpack_file) ")abbrev category FRAMALG FramedAlgebra" < $< > $@

FRMOD.spad: $(srcdir)/algcat.spad
	$(unpack_file) ")abbrev category FRMOD FramedModule" < $< > $@

MONOGEN.spad: $(srcdir)/algcat.spad
	$(unpack_file) ")abbrev category MONOGEN MonogenicAlgebra" < $< > $@

CPIMA.spad: $(srcdir)/algcat.spad
	$(unpack_file) ")abbrev package CPIMA CharacteristicPolynomialInMonogenicalAlgebra" < $< > $@

NORMMA.spad: $(srcdir)/algcat.spad
	$(unpack_file) ")abbrev package NORMMA NormInMonogenicAlgebra" < $< > $@

SAE.spad: $(srcdir)/algext.spad
	$(unpack_file) ")abbrev domain SAE SimpleAlgebraicExtension" < $< > $@

ALGFACT.spad: $(srcdir)/algfact.spad
	$(unpack_file) ")abbrev package ALGFACT AlgFactor" < $< > $@

IALGFACT.spad: $(srcdir)/algfact.spad
	$(unpack_file) ")abbrev package IALGFACT InnerAlgFactor" < $< > $@

RFFACT.spad: $(srcdir)/algfact.spad
	$(unpack_file) ")abbrev package RFFACT RationalFunctionFactor" < $< > $@

ACF.spad: $(srcdir)/algfunc.spad
	$(unpack_file) ")abbrev category ACF AlgebraicallyClosedField" < $< > $@

ACFS.spad: $(srcdir)/algfunc.spad
	$(unpack_file) ")abbrev category ACFS AlgebraicallyClosedFunctionSpace" < $< > $@

AF.spad: $(srcdir)/algfunc.spad
	$(unpack_file) ")abbrev package AF AlgebraicFunction" < $< > $@

FACTCAT.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev category FACTCAT FacetCategory" < $< > $@

CFACET.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain CFACET CubicalFacet" < $< > $@

CHAINC.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain CHAINC ChainComplex" < $< > $@

COCHNC.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain COCHNC CoChainComplex" < $< > $@

CUBEC.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain CUBEC FiniteCubicalComplex" < $< > $@

DELTAC.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain DELTAC DeltaComplex" < $< > $@

OFACET.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain OFACET OrientedFacet" < $< > $@

PFACET.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain PFACET ProductFacet" < $< > $@

SIMPC.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev domain SIMPC FiniteSimplicialComplex" < $< > $@

CUBECF.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev package CUBECF CubicalComplexFactory" < $< > $@

DELTCF.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev package DELTCF DeltaComplexFactory" < $< > $@

SIMPCF.spad: $(srcdir)/alg_top.spad
	$(unpack_file) ")abbrev package SIMPCF SimplicialComplexFactory" < $< > $@

GENMFACT.spad: $(srcdir)/allfact.spad
	$(unpack_file) ")abbrev package GENMFACT GeneralizedMultivariateFactorize" < $< > $@

MPCPF.spad: $(srcdir)/allfact.spad
	$(unpack_file) ")abbrev package MPCPF MPolyCatPolyFactorizer" < $< > $@

MPRFF.spad: $(srcdir)/allfact.spad
	$(unpack_file) ")abbrev package MPRFF MPolyCatRationalFunctionFactorizer" < $< > $@

MRATFAC.spad: $(srcdir)/allfact.spad
	$(unpack_file) ")abbrev package MRATFAC MRationalFactorize" < $< > $@

DBASE.spad: $(srcdir)/alql.spad
	$(unpack_file) ")abbrev domain DBASE Database" < $< > $@

DLIST.spad: $(srcdir)/alql.spad
	$(unpack_file) ")abbrev domain DLIST DataList" < $< > $@

ICARD.spad: $(srcdir)/alql.spad
	$(unpack_file) ")abbrev domain ICARD IndexCard" < $< > $@

QEQUAT.spad: $(srcdir)/alql.spad
	$(unpack_file) ")abbrev domain QEQUAT QueryEquation" < $< > $@

MTHING.spad: $(srcdir)/alql.spad
	$(unpack_file) ")abbrev package MTHING MergeThing" < $< > $@

OPQUERY.spad: $(srcdir)/alql.spad
	$(unpack_file) ")abbrev package OPQUERY OperationsQuery" < $< > $@

MAGCDOC.spad: $(srcdir)/amodgcd.spad
	$(unpack_file) ")abbrev category MAGCDOC ModularAlgebraicGcdOperations" < $< > $@

MAGCD2.spad: $(srcdir)/amodgcd.spad
	$(unpack_file) ")abbrev package MAGCD2 ModularAlgebraicGcd2" < $< > $@

MAGCD.spad: $(srcdir)/amodgcd.spad
	$(unpack_file) ")abbrev package MAGCD ModularAlgebraicGcd" < $< > $@

MAGCDT2.spad: $(srcdir)/amodgcd.spad
	$(unpack_file) ")abbrev package MAGCDT2 ModularAlgebraicGcdTools2" < $< > $@

MAGCDT3.spad: $(srcdir)/amodgcd.spad
	$(unpack_file) ")abbrev package MAGCDT3 ModularAlgebraicGcdTools3" < $< > $@

MAGCDT4.spad: $(srcdir)/amodgcd.spad
	$(unpack_file) ")abbrev package MAGCDT4 ModularAlgebraicGcdTools4" < $< > $@

PRIGCD3.spad: $(srcdir)/amodgcd.spad
	$(unpack_file) ")abbrev package PRIGCD3 PrimGCD" < $< > $@

ANY.spad: $(srcdir)/any.spad
	$(unpack_file) ")abbrev domain ANY Any" < $< > $@

EXIT.spad: $(srcdir)/any.spad
	$(unpack_file) ")abbrev domain EXIT Exit" < $< > $@

NONE.spad: $(srcdir)/any.spad
	$(unpack_file) ")abbrev domain NONE None" < $< > $@

VOID.spad: $(srcdir)/any.spad
	$(unpack_file) ")abbrev domain VOID Void" < $< > $@

ANY1.spad: $(srcdir)/any.spad
	$(unpack_file) ")abbrev package ANY1 AnyFunctions1" < $< > $@

NONE1.spad: $(srcdir)/any.spad
	$(unpack_file) ")abbrev package NONE1 NoneFunctions1" < $< > $@

RESLATC.spad: $(srcdir)/any.spad
	$(unpack_file) ")abbrev package RESLATC ResolveLatticeCompletion" < $< > $@

ARRAY1.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev domain ARRAY1 OneDimensionalArray" < $< > $@

FARRAY.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev domain FARRAY FlexibleArray" < $< > $@

IARRAY1.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev domain IARRAY1 IndexedOneDimensionalArray" < $< > $@

IFARRAY.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev domain IFARRAY IndexedFlexibleArray" < $< > $@

PRIMARR.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev domain PRIMARR PrimitiveArray" < $< > $@

TUPLE.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev domain TUPLE Tuple" < $< > $@

ARRAY12.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev package ARRAY12 OneDimensionalArrayFunctions2" < $< > $@

PRIMARR2.spad: $(srcdir)/array1.spad
	$(unpack_file) ")abbrev package PRIMARR2 PrimitiveArrayFunctions2" < $< > $@

ARR2CAT.spad: $(srcdir)/array2.spad
	$(unpack_file) ")abbrev category ARR2CAT TwoDimensionalArrayCategory" < $< > $@

ARRAY2.spad: $(srcdir)/array2.spad
	$(unpack_file) ")abbrev domain ARRAY2 TwoDimensionalArray" < $< > $@

IARRAY2.spad: $(srcdir)/array2.spad
	$(unpack_file) ")abbrev domain IARRAY2 IndexedTwoDimensionalArray" < $< > $@

IIARRAY2.spad: $(srcdir)/array2.spad
	$(unpack_file) ")abbrev domain IIARRAY2 InnerIndexedTwoDimensionalArray" < $< > $@

ATADDVA.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATADDVA additiveValuation" < $< > $@

ATAPPRO.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATAPPRO Approximate" < $< > $@

ATARBEX.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATARBEX arbitraryExponent" < $< > $@

ATARBPR.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATARBPR arbitraryPrecision" < $< > $@

ATCANCL.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATCANCL canonicalsClosed" < $< > $@

ATCANON.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATCANON Canonical" < $< > $@

ATCS.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATCS CommutativeStar" < $< > $@

ATCUNOR.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATCUNOR canonicalUnitNormal" < $< > $@

ATFINAG.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATFINAG finiteAggregate" < $< > $@

ATLR.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATLR lazyRepresentation" < $< > $@

ATMULVA.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATMULVA multiplicativeValuation" < $< > $@

ATNZDIV.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATNZDIV noZeroDivisors" < $< > $@

ATSHMUT.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATSHMUT shallowlyMutable" < $< > $@

ATTWSR.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATTWSR TwoSidedRecip" < $< > $@

ATUNIKN.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATUNIKN unitsKnown" < $< > $@

ATVCWC.spad: $(srcdir)/attribs.spad
	$(unpack_file) ")abbrev category ATVCWC VariablesCommuteWithCoefficients" < $< > $@

ASTACK.spad: $(srcdir)/bags.spad
	$(unpack_file) ")abbrev domain ASTACK ArrayStack" < $< > $@

DEQUEUE.spad: $(srcdir)/bags.spad
	$(unpack_file) ")abbrev domain DEQUEUE Dequeue" < $< > $@

HEAP.spad: $(srcdir)/bags.spad
	$(unpack_file) ")abbrev domain HEAP Heap" < $< > $@

QUEUE.spad: $(srcdir)/bags.spad
	$(unpack_file) ")abbrev domain QUEUE Queue" < $< > $@

STACK.spad: $(srcdir)/bags.spad
	$(unpack_file) ")abbrev domain STACK Stack" < $< > $@

BEZOUT2.spad: $(srcdir)/bezout.spad
	$(unpack_file) ")abbrev package BEZOUT2 BezoutMatrixWrapper" < $< > $@

BEZOUT.spad: $(srcdir)/bezout.spad
	$(unpack_file) ")abbrev package BEZOUT BezoutMatrix" < $< > $@

BITS.spad: $(srcdir)/boolean.spad
	$(unpack_file) ")abbrev domain BITS Bits" < $< > $@

BOOLEAN.spad: $(srcdir)/boolean.spad
	$(unpack_file) ")abbrev domain BOOLEAN Boolean" < $< > $@

IBITS.spad: $(srcdir)/boolean.spad
	$(unpack_file) ")abbrev domain IBITS IndexedBits" < $< > $@

REF.spad: $(srcdir)/boolean.spad
	$(unpack_file) ")abbrev domain REF Reference" < $< > $@

BRILL.spad: $(srcdir)/brill.spad
	$(unpack_file) ")abbrev package BRILL BrillhartTests" < $< > $@

CARD.spad: $(srcdir)/card.spad
	$(unpack_file) ")abbrev domain CARD CardinalNumber" < $< > $@

GRALG.spad: $(srcdir)/carten.spad
	$(unpack_file) ")abbrev category GRALG GradedAlgebra" < $< > $@

GRMOD.spad: $(srcdir)/carten.spad
	$(unpack_file) ")abbrev category GRMOD GradedModule" < $< > $@

CARTEN.spad: $(srcdir)/carten.spad
	$(unpack_file) ")abbrev domain CARTEN CartesianTensor" < $< > $@

CARTEN2.spad: $(srcdir)/carten.spad
	$(unpack_file) ")abbrev package CARTEN2 CartesianTensorFunctions2" < $< > $@

ABELGRP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ABELGRP AbelianGroup" < $< > $@

ABELMON.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ABELMON AbelianMonoid" < $< > $@

ABELSG.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ABELSG AbelianSemiGroup" < $< > $@

ALGEBRA.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ALGEBRA Algebra" < $< > $@

BASTYPE.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category BASTYPE BasicType" < $< > $@

BMODULE.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category BMODULE BiModule" < $< > $@

CABMON.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category CABMON CancellationAbelianMonoid" < $< > $@

CHARNZ.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category CHARNZ CharacteristicNonZero" < $< > $@

CHARZ.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category CHARZ CharacteristicZero" < $< > $@

COMPAR.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category COMPAR Comparable" < $< > $@

COMRING.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category COMRING CommutativeRing" < $< > $@

DIFEXT.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category DIFEXT DifferentialExtension" < $< > $@

DIFRING.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category DIFRING DifferentialRing" < $< > $@

DIVRING.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category DIVRING DivisionRing" < $< > $@

ENTIRER.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ENTIRER EntireRing" < $< > $@

EUCDOM.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category EUCDOM EuclideanDomain" < $< > $@

FIELD.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category FIELD Field" < $< > $@

FINITE.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category FINITE Finite" < $< > $@

FLINEXP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category FLINEXP FullyLinearlyExplicitOver" < $< > $@

GCDDOM.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category GCDDOM GcdDomain" < $< > $@

GROUP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category GROUP Group" < $< > $@

INTDOM.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category INTDOM IntegralDomain" < $< > $@

LINEXP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category LINEXP LinearlyExplicitOver" < $< > $@

LMODULE.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category LMODULE LeftModule" < $< > $@

LORER.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category LORER LeftOreRing" < $< > $@

MODULE.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category MODULE Module" < $< > $@

MONOID.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category MONOID Monoid" < $< > $@

OAGROUP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category OAGROUP OrderedAbelianGroup" < $< > $@

OAMON.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category OAMON OrderedAbelianMonoid" < $< > $@

OAMONS.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category OAMONS OrderedAbelianMonoidSup" < $< > $@

OASGP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category OASGP OrderedAbelianSemiGroup" < $< > $@

OCAMON.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category OCAMON OrderedCancellationAbelianMonoid" < $< > $@

OINTDOM.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category OINTDOM OrderedIntegralDomain" < $< > $@

ORDFIN.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ORDFIN OrderedFinite" < $< > $@

ORDMON.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ORDMON OrderedMonoid" < $< > $@

ORDRING.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ORDRING OrderedRing" < $< > $@

ORDSET.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category ORDSET OrderedSet" < $< > $@

OSGROUP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category OSGROUP OrderedSemiGroup" < $< > $@

PDRING.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category PDRING PartialDifferentialRing" < $< > $@

PFECAT.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category PFECAT PolynomialFactorizationExplicit" < $< > $@

PID.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category PID PrincipalIdealDomain" < $< > $@

PORDER.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category PORDER PartialOrder" < $< > $@

RING.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category RING Ring" < $< > $@

RMODULE.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category RMODULE RightModule" < $< > $@

RNG.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category RNG Rng" < $< > $@

SETCAT.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category SETCAT SetCategory" < $< > $@

SGROUP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category SGROUP SemiGroup" < $< > $@

SRING.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category SRING SemiRing" < $< > $@

SRNG.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category SRNG SemiRng" < $< > $@

STEP.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category STEP StepThrough" < $< > $@

UFD.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category UFD UniqueFactorizationDomain" < $< > $@

VSPACE.spad: $(srcdir)/catdef.spad
	$(unpack_file) ")abbrev category VSPACE VectorSpace" < $< > $@

CDEN.spad: $(srcdir)/cden.spad
	$(unpack_file) ")abbrev package CDEN CommonDenominator" < $< > $@

ICDEN.spad: $(srcdir)/cden.spad
	$(unpack_file) ")abbrev package ICDEN InnerCommonDenominator" < $< > $@

MCDEN.spad: $(srcdir)/cden.spad
	$(unpack_file) ")abbrev package MCDEN MatrixCommonDenominator" < $< > $@

PCDEN.spad: $(srcdir)/cden.spad
	$(unpack_file) ")abbrev package PCDEN PolynomialCommonDenominator" < $< > $@

UPCDEN.spad: $(srcdir)/cden.spad
	$(unpack_file) ")abbrev package UPCDEN UnivariatePolynomialCommonDenominator" < $< > $@

CHARPOL2.spad: $(srcdir)/charpol.spad
	$(unpack_file) ")abbrev package CHARPOL2 CharacteristicPolynomial2" < $< > $@

CHARPOL3.spad: $(srcdir)/charpol.spad
	$(unpack_file) ")abbrev package CHARPOL3 CharacteristicPolynomial3" < $< > $@

CLIF.spad: $(srcdir)/clifford.spad
	$(unpack_file) ")abbrev domain CLIF CliffordAlgebra" < $< > $@

QFORM.spad: $(srcdir)/clifford.spad
	$(unpack_file) ")abbrev domain QFORM QuadraticForm" < $< > $@

CLIP.spad: $(srcdir)/clip.spad
	$(unpack_file) ")abbrev package CLIP TwoDimensionalPlotClipping" < $< > $@

KOERCE.spad: $(srcdir)/coerce.spad
	$(unpack_file) ")abbrev category KOERCE CoercibleTo" < $< > $@

KOERCEF.spad: $(srcdir)/coerce.spad
	$(unpack_file) ")abbrev category KOERCEF CoercibleFrom" < $< > $@

KONVERF.spad: $(srcdir)/coerce.spad
	$(unpack_file) ")abbrev category KONVERF ConvertibleFrom" < $< > $@

KONVERT.spad: $(srcdir)/coerce.spad
	$(unpack_file) ")abbrev category KONVERT ConvertibleTo" < $< > $@

RETFROM.spad: $(srcdir)/coerce.spad
	$(unpack_file) ")abbrev category RETFROM RetractableFrom" < $< > $@

RETRACT.spad: $(srcdir)/coerce.spad
	$(unpack_file) ")abbrev category RETRACT RetractableTo" < $< > $@

TYPE.spad: $(srcdir)/coerce.spad
	$(unpack_file) ")abbrev category TYPE Type" < $< > $@

COLOR.spad: $(srcdir)/color.spad
	$(unpack_file) ")abbrev domain COLOR Color" < $< > $@

PALETTE.spad: $(srcdir)/color.spad
	$(unpack_file) ")abbrev domain PALETTE Palette" < $< > $@

COMBOPC.spad: $(srcdir)/combfunc.spad
	$(unpack_file) ")abbrev category COMBOPC CombinatorialOpsCategory" < $< > $@

COMBF.spad: $(srcdir)/combfunc.spad
	$(unpack_file) ")abbrev package COMBF CombinatorialFunction" < $< > $@

FSPECF.spad: $(srcdir)/combfunc.spad
	$(unpack_file) ")abbrev package FSPECF FunctionalSpecialFunction" < $< > $@

SUMFS.spad: $(srcdir)/combfunc.spad
	$(unpack_file) ")abbrev package SUMFS FunctionSpaceSum" < $< > $@

COMBINAT.spad: $(srcdir)/combinat.spad
	$(unpack_file) ")abbrev package COMBINAT IntegerCombinatoricFunctions" < $< > $@

ONECOMP.spad: $(srcdir)/complet.spad
	$(unpack_file) ")abbrev domain ONECOMP OnePointCompletion" < $< > $@

ORDCOMP.spad: $(srcdir)/complet.spad
	$(unpack_file) ")abbrev domain ORDCOMP OrderedCompletion" < $< > $@

INFINITY.spad: $(srcdir)/complet.spad
	$(unpack_file) ")abbrev package INFINITY Infinity" < $< > $@

ONECOMP2.spad: $(srcdir)/complet.spad
	$(unpack_file) ")abbrev package ONECOMP2 OnePointCompletionFunctions2" < $< > $@

ORDCOMP2.spad: $(srcdir)/complet.spad
	$(unpack_file) ")abbrev package ORDCOMP2 OrderedCompletionFunctions2" < $< > $@

VARCAT.spad: $(srcdir)/computation.spad
	$(unpack_file) ")abbrev category VARCAT VarCat" < $< > $@

LAMBDA.spad: $(srcdir)/computation.spad
	$(unpack_file) ")abbrev domain LAMBDA Lambda" < $< > $@

SKICOMB.spad: $(srcdir)/computation.spad
	$(unpack_file) ")abbrev domain SKICOMB SKICombinators" < $< > $@

TYPED.spad: $(srcdir)/computation.spad
	$(unpack_file) ")abbrev domain TYPED Typed" < $< > $@

UNTYPED.spad: $(srcdir)/computation.spad
	$(unpack_file) ")abbrev domain UNTYPED Untyped" < $< > $@

COMPCODE.spad: $(srcdir)/computation.spad
	$(unpack_file) ")abbrev package COMPCODE compCode" < $< > $@

COMPUTIL.spad: $(srcdir)/computation.spad
	$(unpack_file) ")abbrev package COMPUTIL compUtil" < $< > $@

SCANUTIL.spad: $(srcdir)/computil.spad
	$(unpack_file) ")abbrev package SCANUTIL ScanningUtilities" < $< > $@

AN.spad: $(srcdir)/constant.spad
	$(unpack_file) ")abbrev domain AN AlgebraicNumber" < $< > $@

CONTFRAC.spad: $(srcdir)/contfrac.spad
	$(unpack_file) ")abbrev domain CONTFRAC ContinuedFraction" < $< > $@

NCNTFRAC.spad: $(srcdir)/contfrac.spad
	$(unpack_file) ")abbrev package NCNTFRAC NumericContinuedFraction" < $< > $@

COORDSYS.spad: $(srcdir)/coordsys.spad
	$(unpack_file) ")abbrev package COORDSYS CoordinateSystems" < $< > $@

CRAPACK.spad: $(srcdir)/cra.spad
	$(unpack_file) ")abbrev package CRAPACK CRApackage" < $< > $@

CRFP.spad: $(srcdir)/crfp.spad
	$(unpack_file) ")abbrev package CRFP ComplexRootFindingPackage" < $< > $@

FFCAT.spad: $(srcdir)/curve.spad
	$(unpack_file) ")abbrev category FFCAT FunctionFieldCategory" < $< > $@

ALGFF.spad: $(srcdir)/curve.spad
	$(unpack_file) ")abbrev domain ALGFF AlgebraicFunctionField" < $< > $@

RADFF.spad: $(srcdir)/curve.spad
	$(unpack_file) ")abbrev domain RADFF RadicalFunctionField" < $< > $@

CHVAR.spad: $(srcdir)/curve.spad
	$(unpack_file) ")abbrev package CHVAR ChangeOfVariable" < $< > $@

FFCAT2.spad: $(srcdir)/curve.spad
	$(unpack_file) ")abbrev package FFCAT2 FunctionFieldCategoryFunctions2" < $< > $@

MMAP.spad: $(srcdir)/curve.spad
	$(unpack_file) ")abbrev package MMAP MultipleMap" < $< > $@

CYCLES.spad: $(srcdir)/cycles.spad
	$(unpack_file) ")abbrev package CYCLES CycleIndicators" < $< > $@

EVALCYC.spad: $(srcdir)/cycles.spad
	$(unpack_file) ")abbrev package EVALCYC EvaluateCycleIndicators" < $< > $@

CYCLOTOM.spad: $(srcdir)/cyclotom.spad
	$(unpack_file) ")abbrev package CYCLOTOM CyclotomicPolynomialPackage" < $< > $@

CELL.spad: $(srcdir)/cyldec.spad
	$(unpack_file) ")abbrev domain CELL Cell" < $< > $@

SCELL.spad: $(srcdir)/cyldec.spad
	$(unpack_file) ")abbrev domain SCELL SimpleCell" < $< > $@

CAD.spad: $(srcdir)/cyldec.spad
	$(unpack_file) ")abbrev package CAD CylindricalAlgebraicDecompositionPackage" < $< > $@

CADU.spad: $(srcdir)/cyldec.spad
	$(unpack_file) ")abbrev package CADU CylindricalAlgebraicDecompositionUtilities" < $< > $@

DDFACT.spad: $(srcdir)/ddfact.spad
	$(unpack_file) ")abbrev package DDFACT DistinctDegreeFactorize" < $< > $@

FLASORT.spad: $(srcdir)/defaults.spad
	$(unpack_file) ")abbrev package FLASORT FiniteLinearAggregateSort" < $< > $@

REPDB.spad: $(srcdir)/defaults.spad
	$(unpack_file) ")abbrev package REPDB RepeatedDoubling" < $< > $@

REPSQ.spad: $(srcdir)/defaults.spad
	$(unpack_file) ")abbrev package REPSQ RepeatedSquaring" < $< > $@

DEFINTEF.spad: $(srcdir)/defintef.spad
	$(unpack_file) ")abbrev package DEFINTEF ElementaryFunctionDefiniteIntegration" < $< > $@

DEFINTRF.spad: $(srcdir)/defintrf.spad
	$(unpack_file) ")abbrev package DEFINTRF RationalFunctionDefiniteIntegration" < $< > $@

DFINTTLS.spad: $(srcdir)/defintrf.spad
	$(unpack_file) ")abbrev package DFINTTLS DefiniteIntegrationTools" < $< > $@

LALG.spad: $(srcdir)/derham.spad
	$(unpack_file) ")abbrev category LALG LeftAlgebra" < $< > $@

ANTISYM.spad: $(srcdir)/derham.spad
	$(unpack_file) ")abbrev domain ANTISYM AntiSymm" < $< > $@

DERHAM.spad: $(srcdir)/derham.spad
	$(unpack_file) ")abbrev domain DERHAM DeRhamComplex" < $< > $@

EAB.spad: $(srcdir)/derham.spad
	$(unpack_file) ")abbrev domain EAB ExtAlgBasis" < $< > $@

DHMATRIX.spad: $(srcdir)/dhmatrix.spad
	$(unpack_file) ")abbrev domain DHMATRIX DenavitHartenbergMatrix" < $< > $@

DIRRING.spad: $(srcdir)/dirichlet.spad
	$(unpack_file) ")abbrev domain DIRRING DirichletRing" < $< > $@

FINGEN.spad: $(srcdir)/discrgrp.spad
	$(unpack_file) ")abbrev category FINGEN FinitelyGenerated" < $< > $@

FINGRP.spad: $(srcdir)/discrgrp.spad
	$(unpack_file) ")abbrev category FINGRP FiniteGroup" < $< > $@

CYCGRP.spad: $(srcdir)/discrgrp.spad
	$(unpack_file) ")abbrev domain CYCGRP CyclicGroup" < $< > $@

DIHGRP.spad: $(srcdir)/discrgrp.spad
	$(unpack_file) ")abbrev domain DIHGRP DihedralGroup" < $< > $@

INFCG.spad: $(srcdir)/discrgrp.spad
	$(unpack_file) ")abbrev domain INFCG InfiniteCyclicGroup" < $< > $@

FINGPKG.spad: $(srcdir)/discrgrp.spad
	$(unpack_file) ")abbrev package FINGPKG FiniteGroupPackage" < $< > $@

DISTCAT.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev category DISTCAT DistributionCategory" < $< > $@

SEQUCAT.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev category SEQUCAT SequenceCategory" < $< > $@

DISTRO.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev domain DISTRO Distribution" < $< > $@

SEQU.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev domain SEQU Sequence" < $< > $@

DISTEX.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package DISTEX DistributionPackage" < $< > $@

DISTPOL.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package DISTPOL DistributionPolynomialPackage" < $< > $@

DISTRO2.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package DISTRO2 DistributionFunctions2" < $< > $@

DSTCFPG.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package DSTCFPG DistributionContinuedFractionPackage" < $< > $@

HANKP.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package HANKP HankelPackage" < $< > $@

MOMPKG.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package MOMPKG MomentPackage" < $< > $@

PARRPKG.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package PARRPKG PathArrayPackage" < $< > $@

SEQU2.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package SEQU2 SequenceFunctions2" < $< > $@

STRANS.spad: $(srcdir)/distro.spad
	$(unpack_file) ")abbrev package STRANS STransformPackage" < $< > $@

FDIVCAT.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev category FDIVCAT FiniteDivisorCategory" < $< > $@

FDIV.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev domain FDIV FiniteDivisor" < $< > $@

FRIDEAL.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev domain FRIDEAL FractionalIdeal" < $< > $@

FRIMOD.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev domain FRIMOD FractionalIdealAsModule" < $< > $@

HELLFDIV.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev domain HELLFDIV HyperellipticFiniteDivisor" < $< > $@

FDIV2.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev package FDIV2 FiniteDivisorFunctions2" < $< > $@

FRIDEAL2.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev package FRIDEAL2 FractionalIdealFunctions2" < $< > $@

MHROWRED.spad: $(srcdir)/divisor.spad
	$(unpack_file) ")abbrev package MHROWRED ModularHermitianRowReduction" < $< > $@

DPOLCAT.spad: $(srcdir)/dpolcat.spad
	$(unpack_file) ")abbrev category DPOLCAT DifferentialPolynomialCategory" < $< > $@

DVARCAT.spad: $(srcdir)/dpolcat.spad
	$(unpack_file) ")abbrev category DVARCAT DifferentialVariableCategory" < $< > $@

DSMP.spad: $(srcdir)/dpolcat.spad
	$(unpack_file) ")abbrev domain DSMP DifferentialSparseMultivariatePolynomial" < $< > $@

ODPOL.spad: $(srcdir)/dpolcat.spad
	$(unpack_file) ")abbrev domain ODPOL OrderlyDifferentialPolynomial" < $< > $@

ODVAR.spad: $(srcdir)/dpolcat.spad
	$(unpack_file) ")abbrev domain ODVAR OrderlyDifferentialVariable" < $< > $@

SDPOL.spad: $(srcdir)/dpolcat.spad
	$(unpack_file) ")abbrev domain SDPOL SequentialDifferentialPolynomial" < $< > $@

SDVAR.spad: $(srcdir)/dpolcat.spad
	$(unpack_file) ")abbrev domain SDVAR SequentialDifferentialVariable" < $< > $@

DROPT.spad: $(srcdir)/drawopt.spad
	$(unpack_file) ")abbrev domain DROPT DrawOption" < $< > $@

DROPT0.spad: $(srcdir)/drawopt.spad
	$(unpack_file) ")abbrev package DROPT0 DrawOptionFunctions0" < $< > $@

DROPT1.spad: $(srcdir)/drawopt.spad
	$(unpack_file) ")abbrev package DROPT1 DrawOptionFunctions1" < $< > $@

DRAWCX.spad: $(srcdir)/drawpak.spad
	$(unpack_file) ")abbrev package DRAWCX DrawComplex" < $< > $@

DRAWCFUN.spad: $(srcdir)/draw.spad
	$(unpack_file) ")abbrev package DRAWCFUN TopLevelDrawFunctionsForCompiledFunctions" < $< > $@

DRAWCURV.spad: $(srcdir)/draw.spad
	$(unpack_file) ")abbrev package DRAWCURV TopLevelDrawFunctionsForAlgebraicCurves" < $< > $@

DRAWPT.spad: $(srcdir)/draw.spad
	$(unpack_file) ")abbrev package DRAWPT TopLevelDrawFunctionsForPoints" < $< > $@

DRAW.spad: $(srcdir)/draw.spad
	$(unpack_file) ")abbrev package DRAW TopLevelDrawFunctions" < $< > $@

CTRIGMNP.spad: $(srcdir)/efstruc.spad
	$(unpack_file) ")abbrev package CTRIGMNP ComplexTrigonometricManipulations" < $< > $@

EFSTRUC.spad: $(srcdir)/efstruc.spad
	$(unpack_file) ")abbrev package EFSTRUC ElementaryFunctionStructurePackage" < $< > $@

ITRIGMNP.spad: $(srcdir)/efstruc.spad
	$(unpack_file) ")abbrev package ITRIGMNP InnerTrigonometricManipulations" < $< > $@

SYMFUNC.spad: $(srcdir)/efstruc.spad
	$(unpack_file) ")abbrev package SYMFUNC SymmetricFunctions" < $< > $@

TANEXP.spad: $(srcdir)/efstruc.spad
	$(unpack_file) ")abbrev package TANEXP TangentExpansions" < $< > $@

TRIGMNIP.spad: $(srcdir)/efstruc.spad
	$(unpack_file) ")abbrev package TRIGMNIP TrigonometricManipulations" < $< > $@

EFULS.spad: $(srcdir)/efuls.spad
	$(unpack_file) ")abbrev package EFULS ElementaryFunctionsUnivariateLaurentSeries" < $< > $@

EFUPXS.spad: $(srcdir)/efupxs.spad
	$(unpack_file) ")abbrev package EFUPXS ElementaryFunctionsUnivariatePuiseuxSeries" < $< > $@

CHARPOL.spad: $(srcdir)/eigen.spad
	$(unpack_file) ")abbrev package CHARPOL CharacteristicPolynomialPackage" < $< > $@

EP.spad: $(srcdir)/eigen.spad
	$(unpack_file) ")abbrev package EP EigenPackage" < $< > $@

IEP.spad: $(srcdir)/eigen.spad
	$(unpack_file) ")abbrev package IEP InnerEigenPackage" < $< > $@

EF.spad: $(srcdir)/elemntry.spad
	$(unpack_file) ")abbrev package EF ElementaryFunction" < $< > $@

ELFUTS.spad: $(srcdir)/elfuts.spad
	$(unpack_file) ")abbrev package ELFUTS EllipticFunctionsUnivariateTaylorSeries" < $< > $@

EVALAB.spad: $(srcdir)/equation1.spad
	$(unpack_file) ")abbrev category EVALAB Evalable" < $< > $@

FEVALAB.spad: $(srcdir)/equation1.spad
	$(unpack_file) ")abbrev category FEVALAB FullyEvalableOver" < $< > $@

IEVALAB.spad: $(srcdir)/equation1.spad
	$(unpack_file) ")abbrev category IEVALAB InnerEvalable" < $< > $@

EQ.spad: $(srcdir)/equation1.spad
	$(unpack_file) ")abbrev domain EQ Equation" < $< > $@

EQ2.spad: $(srcdir)/equation1.spad
	$(unpack_file) ")abbrev package EQ2 EquationFunctions2" < $< > $@

ERROR.spad: $(srcdir)/error.spad
	$(unpack_file) ")abbrev package ERROR ErrorFunctions" < $< > $@

MEVCAT.spad: $(srcdir)/evalut.spad
	$(unpack_file) ")abbrev category MEVCAT ModularEvaluationCategory" < $< > $@

FAKEPOL.spad: $(srcdir)/evalut.spad
	$(unpack_file) ")abbrev domain FAKEPOL FakePolynomial" < $< > $@

MEVAL1.spad: $(srcdir)/evalut.spad
	$(unpack_file) ")abbrev package MEVAL1 ModularEvaluation1" < $< > $@

MEVAL2.spad: $(srcdir)/evalut.spad
	$(unpack_file) ")abbrev package MEVAL2 ModularEvaluation2" < $< > $@

PEVALUT.spad: $(srcdir)/evalut.spad
	$(unpack_file) ")abbrev package PEVALUT PolynomialEvaluationUtilities" < $< > $@

EXPEXPAN.spad: $(srcdir)/expexpan.spad
	$(unpack_file) ")abbrev domain EXPEXPAN ExponentialExpansion" < $< > $@

EXPUPXS.spad: $(srcdir)/expexpan.spad
	$(unpack_file) ")abbrev domain EXPUPXS ExponentialOfUnivariatePuiseuxSeries" < $< > $@

UPXSSING.spad: $(srcdir)/expexpan.spad
	$(unpack_file) ")abbrev domain UPXSSING UnivariatePuiseuxSeriesWithExponentialSingularity" < $< > $@

EXP3D.spad: $(srcdir)/export3D.spad
	$(unpack_file) ")abbrev package EXP3D Export3D" < $< > $@

STEXPS.spad: $(srcdir)/expps.spad
	$(unpack_file) ")abbrev package STEXPS StreamExponentialSeriesOperations" < $< > $@

STEXPST.spad: $(srcdir)/expps.spad
	$(unpack_file) ")abbrev package STEXPST StreamExponentialSeriesTranscendentalFunctions" < $< > $@

EXPR2UPS.spad: $(srcdir)/expr2ups.spad
	$(unpack_file) ")abbrev package EXPR2UPS ExpressionToUnivariatePowerSeries" < $< > $@

EXPRODE.spad: $(srcdir)/exprode.spad
	$(unpack_file) ")abbrev package EXPRODE ExpressionSpaceODESolver" < $< > $@

EXPR.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev domain EXPR Expression" < $< > $@

HACKPI.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev domain HACKPI Pi" < $< > $@

ELINSOL.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package ELINSOL ExpressionLinearSolve" < $< > $@

EXPR2.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package EXPR2 ExpressionFunctions2" < $< > $@

PAN2EXPR.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package PAN2EXPR PolynomialAN2Expression" < $< > $@

PICOERCE.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package PICOERCE PiCoercions" < $< > $@

PMASSFS.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package PMASSFS FunctionSpaceAssertions" < $< > $@

PMASS.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package PMASS PatternMatchAssertions" < $< > $@

PMPRED.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package PMPRED AttachPredicates" < $< > $@

PMPREDFS.spad: $(srcdir)/expr.spad
	$(unpack_file) ")abbrev package PMPREDFS FunctionSpaceAttachPredicates" < $< > $@

EXTRED.spad: $(srcdir)/extred.spad
	$(unpack_file) ")abbrev package EXTRED ExtendedPolynomialReduction" < $< > $@

FACUTIL.spad: $(srcdir)/facutil.spad
	$(unpack_file) ")abbrev package FACUTIL FactoringUtilities" < $< > $@

PUSHVAR.spad: $(srcdir)/facutil.spad
	$(unpack_file) ")abbrev package PUSHVAR PushVariables" < $< > $@

MODFACT.spad: $(srcdir)/ffact.spad
	$(unpack_file) ")abbrev package MODFACT ModularFactorization" < $< > $@

FAXF.spad: $(srcdir)/ffcat.spad
	$(unpack_file) ")abbrev category FAXF FiniteAlgebraicExtensionField" < $< > $@

FFIELDC.spad: $(srcdir)/ffcat.spad
	$(unpack_file) ")abbrev category FFIELDC FiniteFieldCategory" < $< > $@

FPC.spad: $(srcdir)/ffcat.spad
	$(unpack_file) ")abbrev category FPC FieldOfPrimeCharacteristic" < $< > $@

XF.spad: $(srcdir)/ffcat.spad
	$(unpack_file) ")abbrev category XF ExtensionField" < $< > $@

DLP.spad: $(srcdir)/ffcat.spad
	$(unpack_file) ")abbrev package DLP DiscreteLogarithmPackage" < $< > $@

FFSLPE.spad: $(srcdir)/ffcat.spad
	$(unpack_file) ")abbrev package FFSLPE FiniteFieldSolveLinearPolynomialEquation" < $< > $@

FFCG.spad: $(srcdir)/ffcg.spad
	$(unpack_file) ")abbrev domain FFCG FiniteFieldCyclicGroup" < $< > $@

FFCGP.spad: $(srcdir)/ffcg.spad
	$(unpack_file) ")abbrev domain FFCGP FiniteFieldCyclicGroupExtensionByPolynomial" < $< > $@

FFCGX.spad: $(srcdir)/ffcg.spad
	$(unpack_file) ")abbrev domain FFCGX FiniteFieldCyclicGroupExtension" < $< > $@

FAMR2.spad: $(srcdir)/fffg.spad
	$(unpack_file) ")abbrev package FAMR2 FiniteAbelianMonoidRingFunctions2" < $< > $@

FFFGF.spad: $(srcdir)/fffg.spad
	$(unpack_file) ")abbrev package FFFGF FractionFreeFastGaussianFractions" < $< > $@

FFFG.spad: $(srcdir)/fffg.spad
	$(unpack_file) ")abbrev package FFFG FractionFreeFastGaussian" < $< > $@

NEWTON.spad: $(srcdir)/fffg.spad
	$(unpack_file) ")abbrev package NEWTON NewtonInterpolation" < $< > $@

FFF.spad: $(srcdir)/fff.spad
	$(unpack_file) ")abbrev package FFF FiniteFieldFunctions" < $< > $@

FFHOM.spad: $(srcdir)/ffhom.spad
	$(unpack_file) ")abbrev package FFHOM FiniteFieldHomomorphisms" < $< > $@

FFNB.spad: $(srcdir)/ffnb.spad
	$(unpack_file) ")abbrev domain FFNB FiniteFieldNormalBasis" < $< > $@

FFNBP.spad: $(srcdir)/ffnb.spad
	$(unpack_file) ")abbrev domain FFNBP FiniteFieldNormalBasisExtensionByPolynomial" < $< > $@

FFNBX.spad: $(srcdir)/ffnb.spad
	$(unpack_file) ")abbrev domain FFNBX FiniteFieldNormalBasisExtension" < $< > $@

INBFF.spad: $(srcdir)/ffnb.spad
	$(unpack_file) ")abbrev package INBFF InnerNormalBasisFieldFunctions" < $< > $@

FFPOLY2.spad: $(srcdir)/ffpoly.spad
	$(unpack_file) ")abbrev package FFPOLY2 FiniteFieldPolynomialPackage2" < $< > $@

FFPOLY.spad: $(srcdir)/ffpoly.spad
	$(unpack_file) ")abbrev package FFPOLY FiniteFieldPolynomialPackage" < $< > $@

FF.spad: $(srcdir)/ffp.spad
	$(unpack_file) ")abbrev domain FF FiniteField" < $< > $@

FFP.spad: $(srcdir)/ffp.spad
	$(unpack_file) ")abbrev domain FFP FiniteFieldExtensionByPolynomial" < $< > $@

FFX.spad: $(srcdir)/ffp.spad
	$(unpack_file) ")abbrev domain FFX FiniteFieldExtension" < $< > $@

IFF.spad: $(srcdir)/ffp.spad
	$(unpack_file) ")abbrev domain IFF InnerFiniteField" < $< > $@

IRREDFFX.spad: $(srcdir)/ffx.spad
	$(unpack_file) ")abbrev package IRREDFFX IrredPolyOverFiniteField" < $< > $@

FILECAT.spad: $(srcdir)/files.spad
	$(unpack_file) ")abbrev category FILECAT FileCategory" < $< > $@

BINFILE.spad: $(srcdir)/files.spad
	$(unpack_file) ")abbrev domain BINFILE BinaryFile" < $< > $@

FILE.spad: $(srcdir)/files.spad
	$(unpack_file) ")abbrev domain FILE File" < $< > $@

KAFILE.spad: $(srcdir)/files.spad
	$(unpack_file) ")abbrev domain KAFILE KeyedAccessFile" < $< > $@

LIB.spad: $(srcdir)/files.spad
	$(unpack_file) ")abbrev domain LIB Library" < $< > $@

TEXTFILE.spad: $(srcdir)/files.spad
	$(unpack_file) ")abbrev domain TEXTFILE TextFile" < $< > $@

FLOAT.spad: $(srcdir)/float.spad
	$(unpack_file) ")abbrev domain FLOAT Float" < $< > $@

ZMOD.spad: $(srcdir)/fmod.spad
	$(unpack_file) ")abbrev domain ZMOD IntegerMod" < $< > $@

FNCAT.spad: $(srcdir)/fname.spad
	$(unpack_file) ")abbrev category FNCAT FileNameCategory" < $< > $@

FNAME.spad: $(srcdir)/fname.spad
	$(unpack_file) ")abbrev domain FNAME FileName" < $< > $@

COMM.spad: $(srcdir)/fnla.spad
	$(unpack_file) ")abbrev domain COMM Commutator" < $< > $@

FNLA.spad: $(srcdir)/fnla.spad
	$(unpack_file) ")abbrev domain FNLA FreeNilpotentLie" < $< > $@

OSI.spad: $(srcdir)/fnla.spad
	$(unpack_file) ")abbrev domain OSI OrdSetInts" < $< > $@

HB.spad: $(srcdir)/fnla.spad
	$(unpack_file) ")abbrev package HB HallBasis" < $< > $@

FORMULA.spad: $(srcdir)/formula.spad
	$(unpack_file) ")abbrev domain FORMULA ScriptFormulaFormat" < $< > $@

FORMULA1.spad: $(srcdir)/formula.spad
	$(unpack_file) ")abbrev package FORMULA1 ScriptFormulaFormat1" < $< > $@

FMC.spad: $(srcdir)/fortcat.spad
	$(unpack_file) ")abbrev category FMC FortranMatrixCategory" < $< > $@

FMFUN.spad: $(srcdir)/fortcat.spad
	$(unpack_file) ")abbrev category FMFUN FortranMatrixFunctionCategory" < $< > $@

FMTC.spad: $(srcdir)/fortcat.spad
	$(unpack_file) ")abbrev category FMTC FortranMachineTypeCategory" < $< > $@

FORTCAT.spad: $(srcdir)/fortcat.spad
	$(unpack_file) ")abbrev category FORTCAT FortranProgramCategory" < $< > $@

FORTFN.spad: $(srcdir)/fortcat.spad
	$(unpack_file) ")abbrev category FORTFN FortranFunctionCategory" < $< > $@

FVC.spad: $(srcdir)/fortcat.spad
	$(unpack_file) ")abbrev category FVC FortranVectorCategory" < $< > $@

FVFUN.spad: $(srcdir)/fortcat.spad
	$(unpack_file) ")abbrev category FVFUN FortranVectorFunctionCategory" < $< > $@

MCMPLX.spad: $(srcdir)/fortmac.spad
	$(unpack_file) ")abbrev domain MCMPLX MachineComplex" < $< > $@

MFLOAT.spad: $(srcdir)/fortmac.spad
	$(unpack_file) ")abbrev domain MFLOAT MachineFloat" < $< > $@

MINT.spad: $(srcdir)/fortmac.spad
	$(unpack_file) ")abbrev domain MINT MachineInteger" < $< > $@

FORTFORM.spad: $(srcdir)/fortout.spad
	$(unpack_file) ")abbrev domain FORTFORM FortranFormat" < $< > $@

FCTOOL.spad: $(srcdir)/fortout.spad
	$(unpack_file) ")abbrev package FCTOOL FortranCodeTools" < $< > $@

FCPAK1.spad: $(srcdir)/fortpak.spad
	$(unpack_file) ")abbrev package FCPAK1 FortranCodePackage1" < $< > $@

FOP.spad: $(srcdir)/fortpak.spad
	$(unpack_file) ")abbrev package FOP FortranOutputStackPackage" < $< > $@

MCALCFN.spad: $(srcdir)/fortpak.spad
	$(unpack_file) ")abbrev package MCALCFN MultiVariableCalculusFunctions" < $< > $@

TEMUTL.spad: $(srcdir)/fortpak.spad
	$(unpack_file) ")abbrev package TEMUTL TemplateUtilities" < $< > $@

FC.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain FC FortranCode" < $< > $@

FEXPR.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain FEXPR FortranExpression" < $< > $@

FORTRAN.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain FORTRAN FortranProgram" < $< > $@

FTEM.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain FTEM FortranTemplate" < $< > $@

M3D.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain M3D ThreeDimensionalMatrix" < $< > $@

RESULT.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain RESULT Result" < $< > $@

SFORT.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain SFORT SimpleFortranProgram" < $< > $@

SWITCH.spad: $(srcdir)/fortran.spad
	$(unpack_file) ")abbrev domain SWITCH Switch" < $< > $@

FST.spad: $(srcdir)/forttyp.spad
	$(unpack_file) ")abbrev domain FST FortranScalarType" < $< > $@

FT.spad: $(srcdir)/forttyp.spad
	$(unpack_file) ")abbrev domain FT FortranType" < $< > $@

SYMS.spad: $(srcdir)/forttyp.spad
	$(unpack_file) ")abbrev domain SYMS TheSymbolTable" < $< > $@

SYMTAB.spad: $(srcdir)/forttyp.spad
	$(unpack_file) ")abbrev domain SYMTAB SymbolTable" < $< > $@

FCOMP.spad: $(srcdir)/fourier.spad
	$(unpack_file) ")abbrev domain FCOMP FourierComponent" < $< > $@

FSERIES.spad: $(srcdir)/fourier.spad
	$(unpack_file) ")abbrev domain FSERIES FourierSeries" < $< > $@

FPARFRAC.spad: $(srcdir)/fparfrac.spad
	$(unpack_file) ")abbrev domain FPARFRAC FullPartialFractionExpansion" < $< > $@

QFCAT.spad: $(srcdir)/fraction.spad
	$(unpack_file) ")abbrev category QFCAT QuotientFieldCategory" < $< > $@

FRAC.spad: $(srcdir)/fraction.spad
	$(unpack_file) ")abbrev domain FRAC Fraction" < $< > $@

LA.spad: $(srcdir)/fraction.spad
	$(unpack_file) ")abbrev domain LA LocalAlgebra" < $< > $@

LO.spad: $(srcdir)/fraction.spad
	$(unpack_file) ")abbrev domain LO Localize" < $< > $@

FRAC2.spad: $(srcdir)/fraction.spad
	$(unpack_file) ")abbrev package FRAC2 FractionFunctions2" < $< > $@

LPEFRAC.spad: $(srcdir)/fraction.spad
	$(unpack_file) ")abbrev package LPEFRAC LinearPolynomialEquationByFractions" < $< > $@

QFCAT2.spad: $(srcdir)/fraction.spad
	$(unpack_file) ")abbrev package QFCAT2 QuotientFieldCategoryFunctions2" < $< > $@

FGROUP.spad: $(srcdir)/free.spad
	$(unpack_file) ")abbrev domain FGROUP FreeGroup" < $< > $@

FMONOID.spad: $(srcdir)/free.spad
	$(unpack_file) ")abbrev domain FMONOID FreeMonoid" < $< > $@

LMOPS.spad: $(srcdir)/free.spad
	$(unpack_file) ")abbrev domain LMOPS ListMonoidOps" < $< > $@

FR.spad: $(srcdir)/fr.spad
	$(unpack_file) ")abbrev domain FR Factored" < $< > $@

FR2.spad: $(srcdir)/fr.spad
	$(unpack_file) ")abbrev package FR2 FactoredFunctions2" < $< > $@

FRUTIL.spad: $(srcdir)/fr.spad
	$(unpack_file) ")abbrev package FRUTIL FactoredFunctionUtilities" < $< > $@

FS2EXPXP.spad: $(srcdir)/fs2expxp.spad
	$(unpack_file) ")abbrev package FS2EXPXP FunctionSpaceToExponentialExpansion" < $< > $@

FS2UPS2.spad: $(srcdir)/fs2ups.spad
	$(unpack_file) ")abbrev package FS2UPS2 FunctionSpaceToUnivariatePowerSeries2" < $< > $@

FS2UPS.spad: $(srcdir)/fs2ups.spad
	$(unpack_file) ")abbrev package FS2UPS FunctionSpaceToUnivariatePowerSeries" < $< > $@

ES.spad: $(srcdir)/fspace.spad
	$(unpack_file) ")abbrev category ES ExpressionSpace" < $< > $@

FS.spad: $(srcdir)/fspace.spad
	$(unpack_file) ")abbrev category FS FunctionSpace" < $< > $@

ES1.spad: $(srcdir)/fspace.spad
	$(unpack_file) ")abbrev package ES1 ExpressionSpaceFunctions1" < $< > $@

ES2.spad: $(srcdir)/fspace.spad
	$(unpack_file) ")abbrev package ES2 ExpressionSpaceFunctions2" < $< > $@

FS2.spad: $(srcdir)/fspace.spad
	$(unpack_file) ")abbrev package FS2 FunctionSpaceFunctions2" < $< > $@

GALFACT.spad: $(srcdir)/galfact.spad
	$(unpack_file) ")abbrev package GALFACT GaloisGroupFactorizer" < $< > $@

GALFACTU.spad: $(srcdir)/galfact.spad
	$(unpack_file) ")abbrev package GALFACTU GaloisGroupFactorizationUtilities" < $< > $@

GALPOLYU.spad: $(srcdir)/galfact.spad
	$(unpack_file) ")abbrev package GALPOLYU GaloisGroupPolynomialUtilities" < $< > $@

GALUTIL.spad: $(srcdir)/galfact.spad
	$(unpack_file) ")abbrev package GALUTIL GaloisGroupUtilities" < $< > $@

GAUSSFAC.spad: $(srcdir)/gaussfac.spad
	$(unpack_file) ")abbrev package GAUSSFAC GaussianFactorizationPackage" < $< > $@

COMPCAT.spad: $(srcdir)/gaussian.spad
	$(unpack_file) ")abbrev category COMPCAT ComplexCategory" < $< > $@

COMPLEX.spad: $(srcdir)/gaussian.spad
	$(unpack_file) ")abbrev domain COMPLEX Complex" < $< > $@

CINTSLPE.spad: $(srcdir)/gaussian.spad
	$(unpack_file) ")abbrev package CINTSLPE ComplexIntegerSolveLinearPolynomialEquation" < $< > $@

COMPLEX2.spad: $(srcdir)/gaussian.spad
	$(unpack_file) ")abbrev package COMPLEX2 ComplexFunctions2" < $< > $@

COMPLPAT.spad: $(srcdir)/gaussian.spad
	$(unpack_file) ")abbrev package COMPLPAT ComplexPattern" < $< > $@

CPMATCH.spad: $(srcdir)/gaussian.spad
	$(unpack_file) ")abbrev package CPMATCH ComplexPatternMatch" < $< > $@

GBEUCLID.spad: $(srcdir)/gbeuclid.spad
	$(unpack_file) ")abbrev package GBEUCLID EuclideanGroebnerBasisPackage" < $< > $@

GBINTERN.spad: $(srcdir)/gbintern.spad
	$(unpack_file) ")abbrev package GBINTERN GroebnerInternalPackage" < $< > $@

GB.spad: $(srcdir)/gb.spad
	$(unpack_file) ")abbrev package GB GroebnerPackage" < $< > $@

HDP.spad: $(srcdir)/gdirprod.spad
	$(unpack_file) ")abbrev domain HDP HomogeneousDirectProduct" < $< > $@

ODP.spad: $(srcdir)/gdirprod.spad
	$(unpack_file) ")abbrev domain ODP OrderedDirectProduct" < $< > $@

SHDP.spad: $(srcdir)/gdirprod.spad
	$(unpack_file) ")abbrev domain SHDP SplitHomogeneousDirectProduct" < $< > $@

ORDFUNS.spad: $(srcdir)/gdirprod.spad
	$(unpack_file) ")abbrev package ORDFUNS OrderingFunctions" < $< > $@

DMP.spad: $(srcdir)/gdpoly.spad
	$(unpack_file) ")abbrev domain DMP DistributedMultivariatePolynomial" < $< > $@

GDMP.spad: $(srcdir)/gdpoly.spad
	$(unpack_file) ")abbrev domain GDMP GeneralDistributedMultivariatePolynomial" < $< > $@

HDMP.spad: $(srcdir)/gdpoly.spad
	$(unpack_file) ")abbrev domain HDMP HomogeneousDistributedMultivariatePolynomial" < $< > $@

GENEEZ.spad: $(srcdir)/geneez.spad
	$(unpack_file) ")abbrev package GENEEZ GenExEuclid" < $< > $@

GCNAALG.spad: $(srcdir)/generic.spad
	$(unpack_file) ")abbrev domain GCNAALG GenericNonAssociativeAlgebra" < $< > $@

CVMP.spad: $(srcdir)/generic.spad
	$(unpack_file) ")abbrev package CVMP CoerceVectorMatrixPackage" < $< > $@

GENUSER.spad: $(srcdir)/genser.spad
	$(unpack_file) ")abbrev domain GENUSER GeneralizedUnivariatePowerSeries" < $< > $@

EFGUSER.spad: $(srcdir)/genser.spad
	$(unpack_file) ")abbrev package EFGUSER ElementaryFunctionsGeneralizedUnivariatePowerSeries" < $< > $@

GENUPS.spad: $(srcdir)/genups.spad
	$(unpack_file) ")abbrev package GENUPS GenerateUnivariatePowerSeries" < $< > $@

GHENSEL.spad: $(srcdir)/ghensel.spad
	$(unpack_file) ")abbrev package GHENSEL GeneralHenselPackage" < $< > $@

GDRAW.spad: $(srcdir)/gnudraw.spad
	$(unpack_file) ")abbrev package GDRAW GnuDraw" < $< > $@

GENPGCD.spad: $(srcdir)/gpgcd.spad
	$(unpack_file) ")abbrev package GENPGCD GeneralPolynomialGcdPackage" < $< > $@

LAUPOL.spad: $(srcdir)/gpol.spad
	$(unpack_file) ")abbrev domain LAUPOL LaurentPolynomial" < $< > $@

GROUPP.spad: $(srcdir)/gpresent.spad
	$(unpack_file) ")abbrev domain GROUPP GroupPresentation" < $< > $@

HOMOL.spad: $(srcdir)/gpresent.spad
	$(unpack_file) ")abbrev domain HOMOL Homology" < $< > $@

GROUPPF1.spad: $(srcdir)/gpresent.spad
	$(unpack_file) ")abbrev package GROUPPF1 GroupPresentationFunctions1" < $< > $@

FGRPH.spad: $(srcdir)/graph.spad
	$(unpack_file) ")abbrev category FGRPH FiniteGraph" < $< > $@

DGRPH.spad: $(srcdir)/graph.spad
	$(unpack_file) ")abbrev domain DGRPH DirectedGraph" < $< > $@

FNGRPH.spad: $(srcdir)/graph.spad
	$(unpack_file) ")abbrev domain FNGRPH FunctionGraph" < $< > $@

LOOP.spad: $(srcdir)/graph.spad
	$(unpack_file) ")abbrev domain LOOP Loop" < $< > $@

MFGRPH.spad: $(srcdir)/graph.spad
	$(unpack_file) ")abbrev domain MFGRPH MultifunctionGraph" < $< > $@

UDGRPH.spad: $(srcdir)/graph.spad
	$(unpack_file) ")abbrev domain UDGRPH UndirectedGraph" < $< > $@

WGRPH.spad: $(srcdir)/graph.spad
	$(unpack_file) ")abbrev domain WGRPH WeightedGraph" < $< > $@

GRDEF.spad: $(srcdir)/grdef.spad
	$(unpack_file) ")abbrev package GRDEF GraphicsDefaults" < $< > $@

GBF.spad: $(srcdir)/groebf.spad
	$(unpack_file) ")abbrev package GBF GroebnerFactorizationPackage" < $< > $@

GROEBSOL.spad: $(srcdir)/groebsol.spad
	$(unpack_file) ")abbrev package GROEBSOL GroebnerSolve" < $< > $@

GSERIES.spad: $(srcdir)/gseries.spad
	$(unpack_file) ")abbrev domain GSERIES GeneralUnivariatePowerSeries" < $< > $@

HASHSTAT.spad: $(srcdir)/hashstate.spad
	$(unpack_file) ")abbrev domain HASHSTAT HashState" < $< > $@

HTMLFORM.spad: $(srcdir)/html.spad
	$(unpack_file) ")abbrev domain HTMLFORM HTMLFormat" < $< > $@

IDEAL.spad: $(srcdir)/ideal.spad
	$(unpack_file) ")abbrev domain IDEAL PolynomialIdeal" < $< > $@

IDECOMP.spad: $(srcdir)/idecomp.spad
	$(unpack_file) ")abbrev package IDECOMP IdealDecompositionPackage" < $< > $@

APRODC.spad: $(srcdir)/indexedp.spad
	$(unpack_file) ")abbrev category APRODC AbelianProductCategory" < $< > $@

IDPC.spad: $(srcdir)/indexedp.spad
	$(unpack_file) ")abbrev category IDPC IndexedDirectProductCategory" < $< > $@

IDPO.spad: $(srcdir)/indexedp.spad
	$(unpack_file) ")abbrev domain IDPO IndexedDirectProductObject" < $< > $@

INTAF.spad: $(srcdir)/intaf.spad
	$(unpack_file) ")abbrev package INTAF AlgebraicIntegration" < $< > $@

INTG0.spad: $(srcdir)/intaf.spad
	$(unpack_file) ")abbrev package INTG0 GenusZeroIntegration" < $< > $@

INTPAF.spad: $(srcdir)/intaf.spad
	$(unpack_file) ")abbrev package INTPAF PureAlgebraicIntegration" < $< > $@

DBLRESP.spad: $(srcdir)/intalg.spad
	$(unpack_file) ")abbrev package DBLRESP DoubleResultantPackage" < $< > $@

INTALG.spad: $(srcdir)/intalg.spad
	$(unpack_file) ")abbrev package INTALG AlgebraicIntegrate" < $< > $@

INTHERAL.spad: $(srcdir)/intalg.spad
	$(unpack_file) ")abbrev package INTHERAL AlgebraicHermiteIntegration" < $< > $@

IR.spad: $(srcdir)/intaux.spad
	$(unpack_file) ")abbrev domain IR IntegrationResult" < $< > $@

INTTOOLS.spad: $(srcdir)/intaux.spad
	$(unpack_file) ")abbrev package INTTOOLS IntegrationTools" < $< > $@

IR2.spad: $(srcdir)/intaux.spad
	$(unpack_file) ")abbrev package IR2 IntegrationResultFunctions2" < $< > $@

FFINTBAS.spad: $(srcdir)/intclos.spad
	$(unpack_file) ")abbrev package FFINTBAS FunctionFieldIntegralBasis" < $< > $@

IBATOOL.spad: $(srcdir)/intclos.spad
	$(unpack_file) ")abbrev package IBATOOL IntegralBasisTools" < $< > $@

NFINTBAS.spad: $(srcdir)/intclos.spad
	$(unpack_file) ")abbrev package NFINTBAS NumberFieldIntegralBasis" < $< > $@

TRIMAT.spad: $(srcdir)/intclos.spad
	$(unpack_file) ")abbrev package TRIMAT TriangularMatrixOperations" < $< > $@

WFFINTBS.spad: $(srcdir)/intclos.spad
	$(unpack_file) ")abbrev package WFFINTBS WildFunctionFieldIntegralBasis" < $< > $@

INTDEN.spad: $(srcdir)/intden.spad
	$(unpack_file) ")abbrev package INTDEN DenominatorIntegration" < $< > $@

PFUTIL.spad: $(srcdir)/intden.spad
	$(unpack_file) ")abbrev package PFUTIL PartialFractionUtilities" < $< > $@

INTEF.spad: $(srcdir)/intef.spad
	$(unpack_file) ")abbrev package INTEF ElementaryIntegration" < $< > $@

INT.spad: $(srcdir)/integer.spad
	$(unpack_file) ")abbrev domain INT Integer" < $< > $@

NNI.spad: $(srcdir)/integer.spad
	$(unpack_file) ")abbrev domain NNI NonNegativeInteger" < $< > $@

PI.spad: $(srcdir)/integer.spad
	$(unpack_file) ")abbrev domain PI PositiveInteger" < $< > $@

ROMAN.spad: $(srcdir)/integer.spad
	$(unpack_file) ")abbrev domain ROMAN RomanNumeral" < $< > $@

INTSLPE.spad: $(srcdir)/integer.spad
	$(unpack_file) ")abbrev package INTSLPE IntegerSolveLinearPolynomialEquation" < $< > $@

FSCINT.spad: $(srcdir)/integrat.spad
	$(unpack_file) ")abbrev package FSCINT FunctionSpaceComplexIntegration" < $< > $@

FSINT.spad: $(srcdir)/integrat.spad
	$(unpack_file) ")abbrev package FSINT FunctionSpaceIntegration" < $< > $@

INTCAT.spad: $(srcdir)/interval.spad
	$(unpack_file) ")abbrev category INTCAT IntervalCategory" < $< > $@

INTRVL.spad: $(srcdir)/interval.spad
	$(unpack_file) ")abbrev domain INTRVL Interval" < $< > $@

INTFACT.spad: $(srcdir)/intfact.spad
	$(unpack_file) ")abbrev package INTFACT IntegerFactorizationPackage" < $< > $@

IROOT.spad: $(srcdir)/intfact.spad
	$(unpack_file) ")abbrev package IROOT IntegerRoots" < $< > $@

PRIMES.spad: $(srcdir)/intfact.spad
	$(unpack_file) ")abbrev package PRIMES IntegerPrimesPackage" < $< > $@

INTLOCP.spad: $(srcdir)/intlocp.spad
	$(unpack_file) ")abbrev domain INTLOCP IntegerLocalizedAtPrime" < $< > $@

EFACTOR.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package EFACTOR ExpressionFactorPolynomial" < $< > $@

INTALG2.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package INTALG2 AlgebraicIntegrate2" < $< > $@

INTPAR1.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package INTPAR1 ParametricTranscendentalIntegration" < $< > $@

INTPAR2.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package INTPAR2 ParametricIntegration" < $< > $@

LINCOMB.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package LINCOMB LinearCombinationUtilities" < $< > $@

RDEAUX.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package RDEAUX RDEaux" < $< > $@

RDEPAR.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package RDEPAR ParametricRischDE" < $< > $@

RFSSPLIT.spad: $(srcdir)/intpar.spad
	$(unpack_file) ")abbrev package RFSSPLIT RootFSSplit" < $< > $@

INTPM.spad: $(srcdir)/intpm.spad
	$(unpack_file) ")abbrev package INTPM PatternMatchIntegration" < $< > $@

INTHERTR.spad: $(srcdir)/intrf.spad
	$(unpack_file) ")abbrev package INTHERTR TranscendentalHermiteIntegration" < $< > $@

INTRAT.spad: $(srcdir)/intrf.spad
	$(unpack_file) ")abbrev package INTRAT RationalIntegration" < $< > $@

INTRF.spad: $(srcdir)/intrf.spad
	$(unpack_file) ")abbrev package INTRF RationalFunctionIntegration" < $< > $@

INTTR.spad: $(srcdir)/intrf.spad
	$(unpack_file) ")abbrev package INTTR TranscendentalIntegration" < $< > $@

MONOTOOL.spad: $(srcdir)/intrf.spad
	$(unpack_file) ")abbrev package MONOTOOL MonomialExtensionTools" < $< > $@

PIT.spad: $(srcdir)/intrf.spad
	$(unpack_file) ")abbrev package PIT ParallelIntegrationTools" < $< > $@

SUBRESP.spad: $(srcdir)/intrf.spad
	$(unpack_file) ")abbrev package SUBRESP SubResultantPackage" < $< > $@

IR2F.spad: $(srcdir)/irexpand.spad
	$(unpack_file) ")abbrev package IR2F IntegrationResultToFunction" < $< > $@

IRRF2F.spad: $(srcdir)/irexpand.spad
	$(unpack_file) ")abbrev package IRRF2F IntegrationResultRFToFunction" < $< > $@

IRSN.spad: $(srcdir)/irsn.spad
	$(unpack_file) ")abbrev package IRSN IrrRepSymNatPackage" < $< > $@

ITUPLE.spad: $(srcdir)/ituple.spad
	$(unpack_file) ")abbrev domain ITUPLE InfiniteTuple" < $< > $@

ITFUN2.spad: $(srcdir)/ituple.spad
	$(unpack_file) ")abbrev package ITFUN2 InfiniteTupleFunctions2" < $< > $@

ITFUN3.spad: $(srcdir)/ituple.spad
	$(unpack_file) ")abbrev package ITFUN3 InfiniteTupleFunctions3" < $< > $@

JBBFC.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev category JBBFC JetBundleBaseFunctionCategory" < $< > $@

JBC.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev category JBC JetBundleCategory" < $< > $@

JBFC.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev category JBFC JetBundleFunctionCategory" < $< > $@

DJBP.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain DJBP DistributedJetBundlePolynomial" < $< > $@

IJB.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain IJB IndexedJetBundle" < $< > $@

JBE.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JBE JetBundleExpression" < $< > $@

JBLF.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JBLF JetBundleLinearFunction" < $< > $@

JBP.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JBP JetBundlePolynomial" < $< > $@

JBSA.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JBSA JetBundleSymAna" < $< > $@

JBUNDLE.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JBUNDLE JetBundle" < $< > $@

JBX.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JBX JetBundleXExpression" < $< > $@

JDE.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JDE JetDifferentialEquation" < $< > $@

JDIFF.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JDIFF JetDifferential" < $< > $@

JLF.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JLF JetLazyFunction" < $< > $@

JVF.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain JVF JetVectorField" < $< > $@

SEM.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev domain SEM SparseEchelonMatrix" < $< > $@

CKP.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev package CKP CartanKuranishi" < $< > $@

JCT.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev package JCT JetCoordinateTransformation" < $< > $@

JGB.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev package JGB JetGroebner" < $< > $@

LUD.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev package LUD LUDecomposition" < $< > $@

SYMANA.spad: $(srcdir)/jet.spad
	$(unpack_file) ")abbrev package SYMANA SymmetryAnalysis" < $< > $@

CACHSET.spad: $(srcdir)/kl.spad
	$(unpack_file) ")abbrev category CACHSET CachableSet" < $< > $@

KERNEL.spad: $(srcdir)/kl.spad
	$(unpack_file) ")abbrev domain KERNEL Kernel" < $< > $@

MKCHSET.spad: $(srcdir)/kl.spad
	$(unpack_file) ")abbrev domain MKCHSET MakeCachableSet" < $< > $@

KERNEL2.spad: $(srcdir)/kl.spad
	$(unpack_file) ")abbrev package KERNEL2 KernelFunctions2" < $< > $@

SCACHE.spad: $(srcdir)/kl.spad
	$(unpack_file) ")abbrev package SCACHE SortedCache" < $< > $@

KOVACIC.spad: $(srcdir)/kovacic.spad
	$(unpack_file) ")abbrev package KOVACIC Kovacic" < $< > $@

INVLAPLA.spad: $(srcdir)/laplace.spad
	$(unpack_file) ")abbrev package INVLAPLA InverseLaplaceTransform" < $< > $@

LAPLACE.spad: $(srcdir)/laplace.spad
	$(unpack_file) ")abbrev package LAPLACE LaplaceTransform" < $< > $@

ULSCCAT.spad: $(srcdir)/laurent.spad
	$(unpack_file) ")abbrev category ULSCCAT UnivariateLaurentSeriesConstructorCategory" < $< > $@

ULSCONS.spad: $(srcdir)/laurent.spad
	$(unpack_file) ")abbrev domain ULSCONS UnivariateLaurentSeriesConstructor" < $< > $@

ULS.spad: $(srcdir)/laurent.spad
	$(unpack_file) ")abbrev domain ULS UnivariateLaurentSeries" < $< > $@

ULS2.spad: $(srcdir)/laurent.spad
	$(unpack_file) ")abbrev package ULS2 UnivariateLaurentSeriesFunctions2" < $< > $@

LEADCDET.spad: $(srcdir)/leadcdet.spad
	$(unpack_file) ")abbrev package LEADCDET LeadingCoefDetermination" < $< > $@

JORDAN.spad: $(srcdir)/lie.spad
	$(unpack_file) ")abbrev domain JORDAN AssociatedJordanAlgebra" < $< > $@

LIE.spad: $(srcdir)/lie.spad
	$(unpack_file) ")abbrev domain LIE AssociatedLieAlgebra" < $< > $@

LSQM.spad: $(srcdir)/lie.spad
	$(unpack_file) ")abbrev domain LSQM LieSquareMatrix" < $< > $@

LIMITPS.spad: $(srcdir)/limitps.spad
	$(unpack_file) ")abbrev package LIMITPS PowerSeriesLimitPackage" < $< > $@

SIGNEF.spad: $(srcdir)/limitps.spad
	$(unpack_file) ")abbrev package SIGNEF ElementaryFunctionSign" < $< > $@

LINDEP.spad: $(srcdir)/lindep.spad
	$(unpack_file) ")abbrev package LINDEP LinearDependence" < $< > $@

ZLINDEP.spad: $(srcdir)/lindep.spad
	$(unpack_file) ")abbrev package ZLINDEP IntegerLinearDependence" < $< > $@

LGROBP.spad: $(srcdir)/lingrob.spad
	$(unpack_file) ")abbrev package LGROBP LinGroebnerPackage" < $< > $@

LF.spad: $(srcdir)/liouv.spad
	$(unpack_file) ")abbrev package LF LiouvillianFunction" < $< > $@

HEUGCD.spad: $(srcdir)/listgcd.spad
	$(unpack_file) ")abbrev package HEUGCD HeuGcd" < $< > $@

ALIST.spad: $(srcdir)/list.spad
	$(unpack_file) ")abbrev domain ALIST AssociationList" < $< > $@

ILIST.spad: $(srcdir)/list.spad
	$(unpack_file) ")abbrev domain ILIST IndexedList" < $< > $@

LIST.spad: $(srcdir)/list.spad
	$(unpack_file) ")abbrev domain LIST List" < $< > $@

LIST2.spad: $(srcdir)/list.spad
	$(unpack_file) ")abbrev package LIST2 ListFunctions2" < $< > $@

LIST2MAP.spad: $(srcdir)/list.spad
	$(unpack_file) ")abbrev package LIST2MAP ListToMap" < $< > $@

LIST3.spad: $(srcdir)/list.spad
	$(unpack_file) ")abbrev package LIST3 ListFunctions3" < $< > $@

LLLRED.spad: $(srcdir)/lll.spad
	$(unpack_file) ")abbrev package LLLRED LLLReduction" < $< > $@

LMDICT.spad: $(srcdir)/lmdict.spad
	$(unpack_file) ")abbrev domain LMDICT ListMultiDictionary" < $< > $@

LODOF2.spad: $(srcdir)/lodof2.spad
	$(unpack_file) ")abbrev package LODOF2 LinearOrdinaryDifferentialOperatorFactorizer2" < $< > $@

VHPSOLV.spad: $(srcdir)/lodof2.spad
	$(unpack_file) ")abbrev package VHPSOLV VectorHermitePadeSolver" < $< > $@

SETMN.spad: $(srcdir)/lodof.spad
	$(unpack_file) ")abbrev domain SETMN SetOfMIntegersInOneToN" < $< > $@

ASSOCEQ.spad: $(srcdir)/lodof.spad
	$(unpack_file) ")abbrev package ASSOCEQ AssociatedEquations" < $< > $@

LODOF.spad: $(srcdir)/lodof.spad
	$(unpack_file) ")abbrev package LODOF LinearOrdinaryDifferentialOperatorFactorizer" < $< > $@

PREASSOC.spad: $(srcdir)/lodof.spad
	$(unpack_file) ")abbrev package PREASSOC PrecomputedAssociatedEquations" < $< > $@

LODOCAT.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev category LODOCAT LinearOrdinaryDifferentialOperatorCategory" < $< > $@

LODO1.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev domain LODO1 LinearOrdinaryDifferentialOperator1" < $< > $@

LODO2.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev domain LODO2 LinearOrdinaryDifferentialOperator2" < $< > $@

LODO3AUX.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev domain LODO3AUX LinearOrdinaryDifferentialOperator3Aux" < $< > $@

LODO3.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev domain LODO3 LinearOrdinaryDifferentialOperator3" < $< > $@

LODO.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev domain LODO LinearOrdinaryDifferentialOperator" < $< > $@

ODR.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev domain ODR OrdinaryDifferentialRing" < $< > $@

LODOCONV.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev package LODOCONV LODOConvertions" < $< > $@

LODOOPS.spad: $(srcdir)/lodo.spad
	$(unpack_file) ")abbrev package LODOOPS LinearOrdinaryDifferentialOperatorsOps" < $< > $@

BDISTL.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category BDISTL BoundedDistributiveLattice" < $< > $@

BICPO.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category BICPO BiCPO" < $< > $@

BJOIN.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category BJOIN BoundedJoinSemilattice" < $< > $@

BLAT.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category BLAT BoundedLattice" < $< > $@

BMEET.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category BMEET BoundedMeetSemilattice" < $< > $@

CODCPO.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category CODCPO CoDcpo" < $< > $@

DCPO.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category DCPO Dcpo" < $< > $@

DISTLAT.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category DISTLAT DistributiveLattice" < $< > $@

JOINLAT.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category JOINLAT JoinSemilattice" < $< > $@

LAT.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category LAT Lattice" < $< > $@

LOGIC.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category LOGIC Logic" < $< > $@

MEETLAT.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category MEETLAT MeetSemilattice" < $< > $@

POSET.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category POSET Poset" < $< > $@

PREORD.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev category PREORD Preorder" < $< > $@

BITST.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain BITST BitStreamFrame" < $< > $@

FBICPO.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain FBICPO FiniteBiCPO" < $< > $@

FCDCPO.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain FCDCPO FiniteCoDcpo" < $< > $@

FDCPO.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain FDCPO FiniteDcpo" < $< > $@

FINLAT.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain FINLAT FiniteLattice" < $< > $@

FMOEBF.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain FMOEBF FiniteMoebiusFunction" < $< > $@

FPOSET.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain FPOSET FinitePoset" < $< > $@

GENMOEBF.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain GENMOEBF GeneralizedFiniteMoebiusFunction" < $< > $@

ILOGIC.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain ILOGIC ILogic" < $< > $@

INCALG.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain INCALG IncidenceAlgebra" < $< > $@

LATJOFM.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain LATJOFM LatticeJoinOfMeets" < $< > $@

LATMOFJ.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain LATMOFJ LatticeMeetOfJoins" < $< > $@

SETLAT.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev domain SETLAT SubsetLattice" < $< > $@

LISTPKG.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev package LISTPKG ListPackage" < $< > $@

POSETF.spad: $(srcdir)/logic.spad
	$(unpack_file) ")abbrev package POSETF PosetFactory" < $< > $@

MAMA.spad: $(srcdir)/mama.spad
	$(unpack_file) ")abbrev package MAMA MatrixManipulation" < $< > $@

ALGMANIP.spad: $(srcdir)/manip.spad
	$(unpack_file) ")abbrev package ALGMANIP AlgebraicManipulations" < $< > $@

FACTFUNC.spad: $(srcdir)/manip.spad
	$(unpack_file) ")abbrev package FACTFUNC FactoredFunctions" < $< > $@

POLYROOT.spad: $(srcdir)/manip.spad
	$(unpack_file) ")abbrev package POLYROOT PolynomialRoots" < $< > $@

SIMPAN.spad: $(srcdir)/manip.spad
	$(unpack_file) ")abbrev package SIMPAN SimplifyAlgebraicNumberConvertPackage" < $< > $@

TRMANIP.spad: $(srcdir)/manip.spad
	$(unpack_file) ")abbrev package TRMANIP TranscendentalManipulations" < $< > $@

GOPT.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev domain GOPT GuessOption" < $< > $@

UFPS.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev domain UFPS UnivariateFormalPowerSeries" < $< > $@

GOPT0.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GOPT0 GuessOptionFunctions0" < $< > $@

GUESSAN.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSAN GuessAlgebraicNumber" < $< > $@

GUESSEB.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSEB GuessExpBin" < $< > $@

GUESSF1.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSF1 GuessFiniteFunctions" < $< > $@

GUESSF.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSF GuessFinite" < $< > $@

GUESS.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESS Guess" < $< > $@

GUESSINT.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSINT GuessInteger" < $< > $@

GUESSP1.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSP1 GuessPolynomialFunctions" < $< > $@

GUESSP.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSP GuessPolynomial" < $< > $@

GUESSPI.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package GUESSPI GuessPolynomialInteger" < $< > $@

STNSR.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package STNSR StreamTensor" < $< > $@

UFPS1.spad: $(srcdir)/mantepse.spad
	$(unpack_file) ")abbrev package UFPS1 UnivariateFormalPowerSeriesFunctions" < $< > $@

MAPHACK1.spad: $(srcdir)/mappkg.spad
	$(unpack_file) ")abbrev package MAPHACK1 MappingPackageInternalHacks1" < $< > $@

MAPHACK2.spad: $(srcdir)/mappkg.spad
	$(unpack_file) ")abbrev package MAPHACK2 MappingPackageInternalHacks2" < $< > $@

MAPHACK3.spad: $(srcdir)/mappkg.spad
	$(unpack_file) ")abbrev package MAPHACK3 MappingPackageInternalHacks3" < $< > $@

MAPPKG1.spad: $(srcdir)/mappkg.spad
	$(unpack_file) ")abbrev package MAPPKG1 MappingPackage1" < $< > $@

MAPPKG2.spad: $(srcdir)/mappkg.spad
	$(unpack_file) ")abbrev package MAPPKG2 MappingPackage2" < $< > $@

MAPPKG3.spad: $(srcdir)/mappkg.spad
	$(unpack_file) ")abbrev package MAPPKG3 MappingPackage3" < $< > $@

MATCAT.spad: $(srcdir)/matcat.spad
	$(unpack_file) ")abbrev category MATCAT MatrixCategory" < $< > $@

RMATCAT.spad: $(srcdir)/matcat.spad
	$(unpack_file) ")abbrev category RMATCAT RectangularMatrixCategory" < $< > $@

SMATCAT.spad: $(srcdir)/matcat.spad
	$(unpack_file) ")abbrev category SMATCAT SquareMatrixCategory" < $< > $@

IMATLIN.spad: $(srcdir)/matfuns.spad
	$(unpack_file) ")abbrev package IMATLIN InnerMatrixLinearAlgebraFunctions" < $< > $@

IMATQF.spad: $(srcdir)/matfuns.spad
	$(unpack_file) ")abbrev package IMATQF InnerMatrixQuotientFieldFunctions" < $< > $@

MATCAT2.spad: $(srcdir)/matfuns.spad
	$(unpack_file) ")abbrev package MATCAT2 MatrixCategoryFunctions2" < $< > $@

MATLIN.spad: $(srcdir)/matfuns.spad
	$(unpack_file) ")abbrev package MATLIN MatrixLinearAlgebraFunctions" < $< > $@

RMCAT2.spad: $(srcdir)/matfuns.spad
	$(unpack_file) ")abbrev package RMCAT2 RectangularMatrixCategoryFunctions2" < $< > $@

MMLFORM.spad: $(srcdir)/mathml.spad
	$(unpack_file) ")abbrev domain MMLFORM MathMLFormat" < $< > $@

IMATRIX.spad: $(srcdir)/matrix.spad
	$(unpack_file) ")abbrev domain IMATRIX IndexedMatrix" < $< > $@

MATRIX.spad: $(srcdir)/matrix.spad
	$(unpack_file) ")abbrev domain MATRIX Matrix" < $< > $@

RMATRIX.spad: $(srcdir)/matrix.spad
	$(unpack_file) ")abbrev domain RMATRIX RectangularMatrix" < $< > $@

SQMATRIX.spad: $(srcdir)/matrix.spad
	$(unpack_file) ")abbrev domain SQMATRIX SquareMatrix" < $< > $@

MATSTOR.spad: $(srcdir)/matstor.spad
	$(unpack_file) ")abbrev package MATSTOR StorageEfficientMatrixOperations" < $< > $@

MESH.spad: $(srcdir)/mesh.spad
	$(unpack_file) ")abbrev package MESH MeshCreationRoutinesForThreeDimensions" < $< > $@

MFINFACT.spad: $(srcdir)/mfinfact.spad
	$(unpack_file) ")abbrev package MFINFACT MultFiniteFactorize" < $< > $@

INFORM.spad: $(srcdir)/mkfunc.spad
	$(unpack_file) ")abbrev domain INFORM InputForm" < $< > $@

INFORM1.spad: $(srcdir)/mkfunc.spad
	$(unpack_file) ")abbrev package INFORM1 InputFormFunctions1" < $< > $@

MKBCFUNC.spad: $(srcdir)/mkfunc.spad
	$(unpack_file) ")abbrev package MKBCFUNC MakeBinaryCompiledFunction" < $< > $@

MKFLCFN.spad: $(srcdir)/mkfunc.spad
	$(unpack_file) ")abbrev package MKFLCFN MakeFloatCompiledFunction" < $< > $@

MKFUNC.spad: $(srcdir)/mkfunc.spad
	$(unpack_file) ")abbrev package MKFUNC MakeFunction" < $< > $@

MKUCFUNC.spad: $(srcdir)/mkfunc.spad
	$(unpack_file) ")abbrev package MKUCFUNC MakeUnaryCompiledFunction" < $< > $@

MKRECORD.spad: $(srcdir)/mkrecord.spad
	$(unpack_file) ")abbrev package MKRECORD MakeRecord" < $< > $@

MLIFT.spad: $(srcdir)/mlift.spad
	$(unpack_file) ")abbrev package MLIFT MultivariateLifting" < $< > $@

MDDFACT.spad: $(srcdir)/moddfact.spad
	$(unpack_file) ")abbrev package MDDFACT ModularDistinctDegreeFactorizer" < $< > $@

INMODGCD.spad: $(srcdir)/modgcd.spad
	$(unpack_file) ")abbrev package INMODGCD InnerModularGcd" < $< > $@

IMODHP.spad: $(srcdir)/modhpsol.spad
	$(unpack_file) ")abbrev package IMODHP InnerModularHermitePade" < $< > $@

MODHP.spad: $(srcdir)/modhpsol.spad
	$(unpack_file) ")abbrev package MODHP ModularHermitePade" < $< > $@

MODHPS.spad: $(srcdir)/modhpsol.spad
	$(unpack_file) ")abbrev package MODHPS ModularHermitePadeSolver" < $< > $@

NBLM.spad: $(srcdir)/modhpsol.spad
	$(unpack_file) ")abbrev package NBLM NaiveBeckermannLabahnModular" < $< > $@

GMODPOL.spad: $(srcdir)/modmonom.spad
	$(unpack_file) ")abbrev domain GMODPOL GeneralModulePolynomial" < $< > $@

MODMONOM.spad: $(srcdir)/modmonom.spad
	$(unpack_file) ")abbrev domain MODMONOM ModuleMonomial" < $< > $@

MODMON.spad: $(srcdir)/modmon.spad
	$(unpack_file) ")abbrev domain MODMON ModMonic" < $< > $@

EMR.spad: $(srcdir)/modring.spad
	$(unpack_file) ")abbrev domain EMR EuclideanModularRing" < $< > $@

MODFIELD.spad: $(srcdir)/modring.spad
	$(unpack_file) ")abbrev domain MODFIELD ModularField" < $< > $@

MODRING.spad: $(srcdir)/modring.spad
	$(unpack_file) ")abbrev domain MODRING ModularRing" < $< > $@

MOEBIUS.spad: $(srcdir)/moebius.spad
	$(unpack_file) ")abbrev domain MOEBIUS MoebiusTransform" < $< > $@

MRCAT.spad: $(srcdir)/mring.spad
	$(unpack_file) ")abbrev category MRCAT MonoidRingCategory" < $< > $@

MRING.spad: $(srcdir)/mring.spad
	$(unpack_file) ")abbrev domain MRING MonoidRing" < $< > $@

MRF2.spad: $(srcdir)/mring.spad
	$(unpack_file) ")abbrev package MRF2 MonoidRingFunctions2" < $< > $@

OEXPR.spad: $(srcdir)/mrv_limit.spad
	$(unpack_file) ")abbrev domain OEXPR OrderedExpression" < $< > $@

MRVLIM.spad: $(srcdir)/mrv_limit.spad
	$(unpack_file) ")abbrev package MRVLIM MrvLimitPackage" < $< > $@

MSET.spad: $(srcdir)/mset.spad
	$(unpack_file) ")abbrev domain MSET Multiset" < $< > $@

SMTS.spad: $(srcdir)/mts.spad
	$(unpack_file) ")abbrev domain SMTS SparseMultivariateTaylorSeries" < $< > $@

TS.spad: $(srcdir)/mts.spad
	$(unpack_file) ")abbrev domain TS TaylorSeries" < $< > $@

GCDBAS.spad: $(srcdir)/muldep.spad
	$(unpack_file) ")abbrev package GCDBAS GcdBasis" < $< > $@

MULDEP.spad: $(srcdir)/muldep.spad
	$(unpack_file) ")abbrev package MULDEP MultiplicativeDependence" < $< > $@

ALGMFACT.spad: $(srcdir)/multfact.spad
	$(unpack_file) ")abbrev package ALGMFACT AlgebraicMultFact" < $< > $@

INNMFACT.spad: $(srcdir)/multfact.spad
	$(unpack_file) ")abbrev package INNMFACT InnerMultFact" < $< > $@

MULTFACT.spad: $(srcdir)/multfact.spad
	$(unpack_file) ")abbrev package MULTFACT MultivariateFactorize" < $< > $@

INDE.spad: $(srcdir)/multpoly.spad
	$(unpack_file) ")abbrev domain INDE IndexedExponents" < $< > $@

MPOLY.spad: $(srcdir)/multpoly.spad
	$(unpack_file) ")abbrev domain MPOLY MultivariatePolynomial" < $< > $@

POLY.spad: $(srcdir)/multpoly.spad
	$(unpack_file) ")abbrev domain POLY Polynomial" < $< > $@

SMP.spad: $(srcdir)/multpoly.spad
	$(unpack_file) ")abbrev domain SMP SparseMultivariatePolynomial" < $< > $@

POLY2.spad: $(srcdir)/multpoly.spad
	$(unpack_file) ")abbrev package POLY2 PolynomialFunctions2" < $< > $@

SMPCOER.spad: $(srcdir)/multpoly.spad
	$(unpack_file) ")abbrev package SMPCOER SparsePolynomialCoercionHelpers" < $< > $@

MULTSQFR.spad: $(srcdir)/multsqfr.spad
	$(unpack_file) ")abbrev package MULTSQFR MultivariateSquareFree" < $< > $@

FINAALG.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category FINAALG FiniteRankNonAssociativeAlgebra" < $< > $@

FRNAALG.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category FRNAALG FramedNonAssociativeAlgebra" < $< > $@

MAGMA.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category MAGMA Magma" < $< > $@

MAGMAWU.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category MAGMAWU MagmaWithUnit" < $< > $@

NAALG.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category NAALG NonAssociativeAlgebra" < $< > $@

NARING.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category NARING NonAssociativeRing" < $< > $@

NARNG.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category NARNG NonAssociativeRng" < $< > $@

NASRING.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category NASRING NonAssociativeSemiRing" < $< > $@

NASRNG.spad: $(srcdir)/naalgc.spad
	$(unpack_file) ")abbrev category NASRNG NonAssociativeSemiRng" < $< > $@

ALGSC.spad: $(srcdir)/naalg.spad
	$(unpack_file) ")abbrev domain ALGSC AlgebraGivenByStructuralConstants" < $< > $@

ALGPKG.spad: $(srcdir)/naalg.spad
	$(unpack_file) ")abbrev package ALGPKG AlgebraPackage" < $< > $@

FRNAAF2.spad: $(srcdir)/naalg.spad
	$(unpack_file) ")abbrev package FRNAAF2 FramedNonAssociativeAlgebraFunctions2" < $< > $@

SCPKG.spad: $(srcdir)/naalg.spad
	$(unpack_file) ")abbrev package SCPKG StructuralConstantsPackage" < $< > $@

SPLNODE.spad: $(srcdir)/newdata.spad
	$(unpack_file) ")abbrev domain SPLNODE SplittingNode" < $< > $@

SPLTREE.spad: $(srcdir)/newdata.spad
	$(unpack_file) ")abbrev domain SPLTREE SplittingTree" < $< > $@

IPRNTPK.spad: $(srcdir)/newdata.spad
	$(unpack_file) ")abbrev package IPRNTPK InternalPrintPackage" < $< > $@

TBCMPPK.spad: $(srcdir)/newdata.spad
	$(unpack_file) ")abbrev package TBCMPPK TabulatedComputationPackage" < $< > $@

PTCAT.spad: $(srcdir)/newpoint.spad
	$(unpack_file) ")abbrev category PTCAT PointCategory" < $< > $@

COMPPROP.spad: $(srcdir)/newpoint.spad
	$(unpack_file) ")abbrev domain COMPPROP SubSpaceComponentProperty" < $< > $@

POINT.spad: $(srcdir)/newpoint.spad
	$(unpack_file) ")abbrev domain POINT Point" < $< > $@

SUBSPACE.spad: $(srcdir)/newpoint.spad
	$(unpack_file) ")abbrev domain SUBSPACE SubSpace" < $< > $@

PTFUNC2.spad: $(srcdir)/newpoint.spad
	$(unpack_file) ")abbrev package PTFUNC2 PointFunctions2" < $< > $@

PTPACK.spad: $(srcdir)/newpoint.spad
	$(unpack_file) ")abbrev package PTPACK PointPackage" < $< > $@

RPOLCAT.spad: $(srcdir)/newpoly.spad
	$(unpack_file) ")abbrev category RPOLCAT RecursivePolynomialCategory" < $< > $@

NSMP.spad: $(srcdir)/newpoly.spad
	$(unpack_file) ")abbrev domain NSMP NewSparseMultivariatePolynomial" < $< > $@

NSUP.spad: $(srcdir)/newpoly.spad
	$(unpack_file) ")abbrev domain NSUP NewSparseUnivariatePolynomial" < $< > $@

NSUP2.spad: $(srcdir)/newpoly.spad
	$(unpack_file) ")abbrev package NSUP2 NewSparseUnivariatePolynomialFunctions2" < $< > $@

NLINSOL.spad: $(srcdir)/nlinsol.spad
	$(unpack_file) ")abbrev package NLINSOL NonLinearSolvePackage" < $< > $@

RETSOL.spad: $(srcdir)/nlinsol.spad
	$(unpack_file) ")abbrev package RETSOL RetractSolvePackage" < $< > $@

NODE1.spad: $(srcdir)/nlode.spad
	$(unpack_file) ")abbrev package NODE1 NonLinearFirstOrderODESolver" < $< > $@

NPCOEF.spad: $(srcdir)/npcoef.spad
	$(unpack_file) ")abbrev package NPCOEF NPCoef" < $< > $@

NTSCAT.spad: $(srcdir)/nregset.spad
	$(unpack_file) ")abbrev category NTSCAT NormalizedTriangularSetCategory" < $< > $@

NORMPK.spad: $(srcdir)/nregset.spad
	$(unpack_file) ")abbrev package NORMPK NormalizationPackage" < $< > $@

SNTSCAT.spad: $(srcdir)/nsregset.spad
	$(unpack_file) ")abbrev category SNTSCAT SquareFreeNormalizedTriangularSetCategory" < $< > $@

LAZM3PK.spad: $(srcdir)/nsregset.spad
	$(unpack_file) ")abbrev package LAZM3PK LazardSetSolvingPackage" < $< > $@

CDFMAT.spad: $(srcdir)/numarr.spad
	$(unpack_file) ")abbrev domain CDFMAT ComplexDoubleFloatMatrix" < $< > $@

CDFVEC.spad: $(srcdir)/numarr.spad
	$(unpack_file) ")abbrev domain CDFVEC ComplexDoubleFloatVector" < $< > $@

DFMAT.spad: $(srcdir)/numarr.spad
	$(unpack_file) ")abbrev domain DFMAT DoubleFloatMatrix" < $< > $@

DFVEC.spad: $(srcdir)/numarr.spad
	$(unpack_file) ")abbrev domain DFVEC DoubleFloatVector" < $< > $@

INEP.spad: $(srcdir)/numeigen.spad
	$(unpack_file) ")abbrev package INEP InnerNumericEigenPackage" < $< > $@

NCEP.spad: $(srcdir)/numeigen.spad
	$(unpack_file) ")abbrev package NCEP NumericComplexEigenPackage" < $< > $@

NREP.spad: $(srcdir)/numeigen.spad
	$(unpack_file) ")abbrev package NREP NumericRealEigenPackage" < $< > $@

DRAWHACK.spad: $(srcdir)/numeric.spad
	$(unpack_file) ")abbrev package DRAWHACK DrawNumericHack" < $< > $@

NUMERIC.spad: $(srcdir)/numeric.spad
	$(unpack_file) ")abbrev package NUMERIC Numeric" < $< > $@

NUMODE.spad: $(srcdir)/numode.spad
	$(unpack_file) ")abbrev package NUMODE NumericalOrdinaryDifferentialEquations" < $< > $@

NUMQUAD.spad: $(srcdir)/numquad.spad
	$(unpack_file) ")abbrev package NUMQUAD NumericalQuadrature" < $< > $@

CMPLXRT.spad: $(srcdir)/numsolve.spad
	$(unpack_file) ")abbrev package CMPLXRT ComplexRootPackage" < $< > $@

FLOATCP.spad: $(srcdir)/numsolve.spad
	$(unpack_file) ")abbrev package FLOATCP FloatingComplexPackage" < $< > $@

FLOATRP.spad: $(srcdir)/numsolve.spad
	$(unpack_file) ")abbrev package FLOATRP FloatingRealPackage" < $< > $@

INFSP.spad: $(srcdir)/numsolve.spad
	$(unpack_file) ")abbrev package INFSP InnerNumericFloatSolvePackage" < $< > $@

INTHEORY.spad: $(srcdir)/numtheor.spad
	$(unpack_file) ")abbrev package INTHEORY IntegerNumberTheoryFunctions" < $< > $@

PNTHEORY.spad: $(srcdir)/numtheor.spad
	$(unpack_file) ")abbrev package PNTHEORY PolynomialNumberTheoryFunctions" < $< > $@

OC.spad: $(srcdir)/oct.spad
	$(unpack_file) ")abbrev category OC OctonionCategory" < $< > $@

OCT.spad: $(srcdir)/oct.spad
	$(unpack_file) ")abbrev domain OCT Octonion" < $< > $@

OCTCT2.spad: $(srcdir)/oct.spad
	$(unpack_file) ")abbrev package OCTCT2 OctonionCategoryFunctions2" < $< > $@

ODEPAL.spad: $(srcdir)/odealg.spad
	$(unpack_file) ")abbrev package ODEPAL PureAlgebraicLODE" < $< > $@

ODERED.spad: $(srcdir)/odealg.spad
	$(unpack_file) ")abbrev package ODERED ReduceLODE" < $< > $@

ODESYS.spad: $(srcdir)/odealg.spad
	$(unpack_file) ")abbrev package ODESYS SystemODESolver" < $< > $@

LODEEF.spad: $(srcdir)/odeef.spad
	$(unpack_file) ")abbrev package LODEEF ElementaryFunctionLODESolver" < $< > $@

ODEEF.spad: $(srcdir)/odeef.spad
	$(unpack_file) ")abbrev package ODEEF ElementaryFunctionODESolver" < $< > $@

REDORDER.spad: $(srcdir)/odeef.spad
	$(unpack_file) ")abbrev package REDORDER ReductionOfOrder" < $< > $@

BALFACT.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package BALFACT BalancedFactorisation" < $< > $@

BOUNDZRO.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package BOUNDZRO BoundIntegerRoots" < $< > $@

ODECONST.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package ODECONST ConstantLODE" < $< > $@

ODEINT.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package ODEINT ODEIntegration" < $< > $@

ODEPRIM.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package ODEPRIM PrimitiveRatDE" < $< > $@

ODERAT.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package ODERAT RationalLODE" < $< > $@

ODETOOLS.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package ODETOOLS ODETools" < $< > $@

UTSODETL.spad: $(srcdir)/oderf.spad
	$(unpack_file) ")abbrev package UTSODETL UTSodetools" < $< > $@

OM.spad: $(srcdir)/omcat.spad
	$(unpack_file) ")abbrev category OM OpenMath" < $< > $@

OMCONN.spad: $(srcdir)/omdev.spad
	$(unpack_file) ")abbrev domain OMCONN OpenMathConnection" < $< > $@

OMDEV.spad: $(srcdir)/omdev.spad
	$(unpack_file) ")abbrev domain OMDEV OpenMathDevice" < $< > $@

OMENC.spad: $(srcdir)/omdev.spad
	$(unpack_file) ")abbrev domain OMENC OpenMathEncoding" < $< > $@

OMPKG.spad: $(srcdir)/omdev.spad
	$(unpack_file) ")abbrev package OMPKG OpenMathPackage" < $< > $@

OMERRK.spad: $(srcdir)/omerror.spad
	$(unpack_file) ")abbrev domain OMERRK OpenMathErrorKind" < $< > $@

OMERR.spad: $(srcdir)/omerror.spad
	$(unpack_file) ")abbrev domain OMERR OpenMathError" < $< > $@

OMSERVER.spad: $(srcdir)/omserver.spad
	$(unpack_file) ")abbrev package OMSERVER OpenMathServerPackage" < $< > $@

MODOP.spad: $(srcdir)/opalg.spad
	$(unpack_file) ")abbrev domain MODOP ModuleOperator" < $< > $@

OP.spad: $(srcdir)/opalg.spad
	$(unpack_file) ")abbrev domain OP Operator" < $< > $@

OMEXPR.spad: $(srcdir)/openmath.spad
	$(unpack_file) ")abbrev package OMEXPR ExpressionToOpenMath" < $< > $@

BOP.spad: $(srcdir)/op.spad
	$(unpack_file) ")abbrev domain BOP BasicOperator" < $< > $@

BOP1.spad: $(srcdir)/op.spad
	$(unpack_file) ")abbrev package BOP1 BasicOperatorFunctions1" < $< > $@

COMMONOP.spad: $(srcdir)/op.spad
	$(unpack_file) ")abbrev package COMMONOP CommonOperators" < $< > $@

SORD.spad: $(srcdir)/ordinal.spad
	$(unpack_file) ")abbrev domain SORD SmallOrdinal" < $< > $@

OREPCAT.spad: $(srcdir)/ore.spad
	$(unpack_file) ")abbrev category OREPCAT UnivariateSkewPolynomialCategory" < $< > $@

AUTOMOR.spad: $(srcdir)/ore.spad
	$(unpack_file) ")abbrev domain AUTOMOR Automorphism" < $< > $@

ORESUP.spad: $(srcdir)/ore.spad
	$(unpack_file) ")abbrev domain ORESUP SparseUnivariateSkewPolynomial" < $< > $@

OREUP.spad: $(srcdir)/ore.spad
	$(unpack_file) ")abbrev domain OREUP UnivariateSkewPolynomial" < $< > $@

APPLYORE.spad: $(srcdir)/ore.spad
	$(unpack_file) ")abbrev package APPLYORE ApplyUnivariateSkewPolynomial" < $< > $@

INTDSOL.spad: $(srcdir)/ore.spad
	$(unpack_file) ")abbrev package INTDSOL IntegrateSolutions" < $< > $@

OREPCTO.spad: $(srcdir)/ore.spad
	$(unpack_file) ")abbrev package OREPCTO UnivariateSkewPolynomialCategoryOps" < $< > $@

FORMCAT.spad: $(srcdir)/outform2.spad
	$(unpack_file) ")abbrev category FORMCAT OutputFormatterCategory" < $< > $@

OFTOOL.spad: $(srcdir)/outform2.spad
	$(unpack_file) ")abbrev package OFTOOL OutputFormTools" < $< > $@

OUTFORM.spad: $(srcdir)/outform.spad
	$(unpack_file) ")abbrev domain OUTFORM OutputForm" < $< > $@

NUMFMT.spad: $(srcdir)/outform.spad
	$(unpack_file) ")abbrev package NUMFMT NumberFormats" < $< > $@

DISPLAY.spad: $(srcdir)/out.spad
	$(unpack_file) ")abbrev package DISPLAY DisplayPackage" < $< > $@

OUT.spad: $(srcdir)/out.spad
	$(unpack_file) ")abbrev package OUT OutputPackage" < $< > $@

PRINT.spad: $(srcdir)/out.spad
	$(unpack_file) ")abbrev package PRINT PrintPackage" < $< > $@

SPECOUT.spad: $(srcdir)/out.spad
	$(unpack_file) ")abbrev package SPECOUT SpecialOutputPackage" < $< > $@

PADEPAC.spad: $(srcdir)/pade.spad
	$(unpack_file) ")abbrev package PADEPAC PadeApproximantPackage" < $< > $@

PADE.spad: $(srcdir)/pade.spad
	$(unpack_file) ")abbrev package PADE PadeApproximants" < $< > $@

IBACHIN.spad: $(srcdir)/padiclib.spad
	$(unpack_file) ")abbrev package IBACHIN ChineseRemainderToolsForIntegralBases" < $< > $@

IBPTOOLS.spad: $(srcdir)/padiclib.spad
	$(unpack_file) ")abbrev package IBPTOOLS IntegralBasisPolynomialTools" < $< > $@

PWFFINTB.spad: $(srcdir)/padiclib.spad
	$(unpack_file) ")abbrev package PWFFINTB PAdicWildFunctionFieldIntegralBasis" < $< > $@

PADICCT.spad: $(srcdir)/padic.spad
	$(unpack_file) ")abbrev category PADICCT PAdicIntegerCategory" < $< > $@

BPADIC.spad: $(srcdir)/padic.spad
	$(unpack_file) ")abbrev domain BPADIC BalancedPAdicInteger" < $< > $@

BPADICRT.spad: $(srcdir)/padic.spad
	$(unpack_file) ")abbrev domain BPADICRT BalancedPAdicRational" < $< > $@

IPADIC.spad: $(srcdir)/padic.spad
	$(unpack_file) ")abbrev domain IPADIC InnerPAdicInteger" < $< > $@

PADIC.spad: $(srcdir)/padic.spad
	$(unpack_file) ")abbrev domain PADIC PAdicInteger" < $< > $@

PADICRAT.spad: $(srcdir)/padic.spad
	$(unpack_file) ")abbrev domain PADICRAT PAdicRational" < $< > $@

PADICRC.spad: $(srcdir)/padic.spad
	$(unpack_file) ")abbrev domain PADICRC PAdicRationalConstructor" < $< > $@

PARPCURV.spad: $(srcdir)/paramete.spad
	$(unpack_file) ")abbrev domain PARPCURV ParametricPlaneCurve" < $< > $@

PARSCURV.spad: $(srcdir)/paramete.spad
	$(unpack_file) ")abbrev domain PARSCURV ParametricSpaceCurve" < $< > $@

PARSURF.spad: $(srcdir)/paramete.spad
	$(unpack_file) ")abbrev domain PARSURF ParametricSurface" < $< > $@

PARPC2.spad: $(srcdir)/paramete.spad
	$(unpack_file) ")abbrev package PARPC2 ParametricPlaneCurveFunctions2" < $< > $@

PARSC2.spad: $(srcdir)/paramete.spad
	$(unpack_file) ")abbrev package PARSC2 ParametricSpaceCurveFunctions2" < $< > $@

PARSU2.spad: $(srcdir)/paramete.spad
	$(unpack_file) ")abbrev package PARSU2 ParametricSurfaceFunctions2" < $< > $@

PARTPERM.spad: $(srcdir)/partperm.spad
	$(unpack_file) ")abbrev package PARTPERM PartitionsAndPermutations" < $< > $@

FPATMAB.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev category FPATMAB FullyPatternMatchable" < $< > $@

PATMAB.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev category PATMAB PatternMatchable" < $< > $@

PATLRES.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev domain PATLRES PatternMatchListResult" < $< > $@

PATRES.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev domain PATRES PatternMatchResult" < $< > $@

PATMATCH.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PATMATCH PatternMatch" < $< > $@

PATRES2.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PATRES2 PatternMatchResultFunctions2" < $< > $@

PMDOWN.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMDOWN PatternMatchPushDown" < $< > $@

PMFS.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMFS PatternMatchFunctionSpace" < $< > $@

PMINS.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMINS PatternMatchIntegerNumberSystem" < $< > $@

PMKERNEL.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMKERNEL PatternMatchKernel" < $< > $@

PMLSAGG.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMLSAGG PatternMatchListAggregate" < $< > $@

PMPLCAT.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMPLCAT PatternMatchPolynomialCategory" < $< > $@

PMQFCAT.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMQFCAT PatternMatchQuotientFieldCategory" < $< > $@

PMSYM.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMSYM PatternMatchSymbol" < $< > $@

PMTOOLS.spad: $(srcdir)/patmatch1.spad
	$(unpack_file) ")abbrev package PMTOOLS PatternMatchTools" < $< > $@

PATAB.spad: $(srcdir)/pattern.spad
	$(unpack_file) ")abbrev category PATAB Patternable" < $< > $@

PATTERN.spad: $(srcdir)/pattern.spad
	$(unpack_file) ")abbrev domain PATTERN Pattern" < $< > $@

PATTERN1.spad: $(srcdir)/pattern.spad
	$(unpack_file) ")abbrev package PATTERN1 PatternFunctions1" < $< > $@

PATTERN2.spad: $(srcdir)/pattern.spad
	$(unpack_file) ")abbrev package PATTERN2 PatternFunctions2" < $< > $@

PPCURVE.spad: $(srcdir)/pcurve.spad
	$(unpack_file) ")abbrev category PPCURVE PlottablePlaneCurveCategory" < $< > $@

PSCURVE.spad: $(srcdir)/pcurve.spad
	$(unpack_file) ")abbrev category PSCURVE PlottableSpaceCurveCategory" < $< > $@

GRAY.spad: $(srcdir)/perman.spad
	$(unpack_file) ")abbrev package GRAY GrayCode" < $< > $@

PERMAN.spad: $(srcdir)/perman.spad
	$(unpack_file) ")abbrev package PERMAN Permanent" < $< > $@

PERMGRP.spad: $(srcdir)/permgrps.spad
	$(unpack_file) ")abbrev domain PERMGRP PermutationGroup" < $< > $@

PGE.spad: $(srcdir)/permgrps.spad
	$(unpack_file) ")abbrev package PGE PermutationGroupExamples" < $< > $@

PERMCAT.spad: $(srcdir)/perm.spad
	$(unpack_file) ")abbrev category PERMCAT PermutationCategory" < $< > $@

PERM.spad: $(srcdir)/perm.spad
	$(unpack_file) ")abbrev domain PERM Permutation" < $< > $@

PFBR.spad: $(srcdir)/pfbr.spad
	$(unpack_file) ")abbrev package PFBR PolynomialFactorizationByRecursion" < $< > $@

FORDER.spad: $(srcdir)/pfo.spad
	$(unpack_file) ")abbrev package FORDER FindOrderFinite" < $< > $@

FSRED.spad: $(srcdir)/pfo.spad
	$(unpack_file) ")abbrev package FSRED FunctionSpaceReduce" < $< > $@

PFO.spad: $(srcdir)/pfo.spad
	$(unpack_file) ")abbrev package PFO PointsOfFiniteOrder" < $< > $@

PFOQ.spad: $(srcdir)/pfo.spad
	$(unpack_file) ")abbrev package PFOQ PointsOfFiniteOrderRational" < $< > $@

PFOTOOLS.spad: $(srcdir)/pfo.spad
	$(unpack_file) ")abbrev package PFOTOOLS PointsOfFiniteOrderTools" < $< > $@

RDIV.spad: $(srcdir)/pfo.spad
	$(unpack_file) ")abbrev package RDIV ReducedDivisor" < $< > $@

PFR.spad: $(srcdir)/pfr.spad
	$(unpack_file) ")abbrev domain PFR PartialFraction" < $< > $@

PFRPAC.spad: $(srcdir)/pfr.spad
	$(unpack_file) ")abbrev package PFRPAC PartialFractionPackage" < $< > $@

IPF.spad: $(srcdir)/pf.spad
	$(unpack_file) ")abbrev domain IPF InnerPrimeField" < $< > $@

PF.spad: $(srcdir)/pf.spad
	$(unpack_file) ")abbrev domain PF PrimeField" < $< > $@

PGCD.spad: $(srcdir)/pgcd.spad
	$(unpack_file) ")abbrev package PGCD PolynomialGcdPackage" < $< > $@

PGROEB.spad: $(srcdir)/pgrobner.spad
	$(unpack_file) ")abbrev package PGROEB PolyGroebner" < $< > $@

PINTERPA.spad: $(srcdir)/pinterp.spad
	$(unpack_file) ")abbrev package PINTERPA PolynomialInterpolationAlgorithms" < $< > $@

PINTERP.spad: $(srcdir)/pinterp.spad
	$(unpack_file) ")abbrev package PINTERP PolynomialInterpolation" < $< > $@

PLEQN.spad: $(srcdir)/pleqn.spad
	$(unpack_file) ")abbrev package PLEQN ParametricLinearEquations" < $< > $@

PLOT3D.spad: $(srcdir)/plot3d.spad
	$(unpack_file) ")abbrev domain PLOT3D Plot3D" < $< > $@

PLOT.spad: $(srcdir)/plot.spad
	$(unpack_file) ")abbrev domain PLOT Plot" < $< > $@

PLOT1.spad: $(srcdir)/plot.spad
	$(unpack_file) ")abbrev package PLOT1 PlotFunctions1" < $< > $@

PLOTTOOL.spad: $(srcdir)/plottool.spad
	$(unpack_file) ")abbrev package PLOTTOOL PlotTools" < $< > $@

PSETCAT.spad: $(srcdir)/polset.spad
	$(unpack_file) ")abbrev category PSETCAT PolynomialSetCategory" < $< > $@

GPOLSET.spad: $(srcdir)/polset.spad
	$(unpack_file) ")abbrev domain GPOLSET GeneralPolynomialSet" < $< > $@

MPC2.spad: $(srcdir)/poltopol.spad
	$(unpack_file) ")abbrev package MPC2 MPolyCatFunctions2" < $< > $@

MPC3.spad: $(srcdir)/poltopol.spad
	$(unpack_file) ")abbrev package MPC3 MPolyCatFunctions3" < $< > $@

POLTOPOL.spad: $(srcdir)/poltopol.spad
	$(unpack_file) ")abbrev package POLTOPOL PolToPol" < $< > $@

AMR.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev category AMR AbelianMonoidRing" < $< > $@

FAMR.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev category FAMR FiniteAbelianMonoidRing" < $< > $@

GPOLCAT.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev category GPOLCAT MaybeSkewPolynomialCategory" < $< > $@

POLYCAT.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev category POLYCAT PolynomialCategory" < $< > $@

UPOLYC.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev category UPOLYC UnivariatePolynomialCategory" < $< > $@

COMMUPC.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev package COMMUPC CommuteUnivariatePolynomialCategory" < $< > $@

POLYLIFT.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev package POLYLIFT PolynomialCategoryLifting" < $< > $@

UPOLYC2.spad: $(srcdir)/polycat.spad
	$(unpack_file) ")abbrev package UPOLYC2 UnivariatePolynomialCategoryFunctions2" < $< > $@

FMCAT.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev category FMCAT FreeModuleCategory" < $< > $@

FM.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev domain FM FreeModule" < $< > $@

PR.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev domain PR PolynomialRing" < $< > $@

SAOS.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev domain SAOS SingletonAsOrderedSet" < $< > $@

SUP.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev domain SUP SparseUnivariatePolynomial" < $< > $@

UP.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev domain UP UnivariatePolynomial" < $< > $@

FM2.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package FM2 FreeModuleFunctions2" < $< > $@

FMCF2.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package FMCF2 FreeModuleCoefficientFunctions2" < $< > $@

POLY2UP.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package POLY2UP PolynomialToUnivariatePolynomial" < $< > $@

PSQFR.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package PSQFR PolynomialSquareFree" < $< > $@

SUP2.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package SUP2 SparseUnivariatePolynomialFunctions2" < $< > $@

UP2.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package UP2 UnivariatePolynomialFunctions2" < $< > $@

UPMP.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package UPMP UnivariatePolynomialMultiplicationPackage" < $< > $@

UPSQFREE.spad: $(srcdir)/poly.spad
	$(unpack_file) ")abbrev package UPSQFREE UnivariatePolynomialSquareFree" < $< > $@

FSPRMELT.spad: $(srcdir)/primelt.spad
	$(unpack_file) ")abbrev package FSPRMELT FunctionSpacePrimitiveElement" < $< > $@

PRIMELT.spad: $(srcdir)/primelt.spad
	$(unpack_file) ")abbrev package PRIMELT PrimitiveElement" < $< > $@

PRODUCT.spad: $(srcdir)/product.spad
	$(unpack_file) ")abbrev domain PRODUCT Product" < $< > $@

PRS.spad: $(srcdir)/prs.spad
	$(unpack_file) ")abbrev package PRS PseudoRemainderSequence" < $< > $@

PRTITION.spad: $(srcdir)/prtition.spad
	$(unpack_file) ")abbrev domain PRTITION Partition" < $< > $@

SYMPOLY.spad: $(srcdir)/prtition.spad
	$(unpack_file) ")abbrev domain SYMPOLY SymmetricPolynomial" < $< > $@

MTSCAT.spad: $(srcdir)/pscat.spad
	$(unpack_file) ")abbrev category MTSCAT MultivariateTaylorSeriesCategory" < $< > $@

PSCAT.spad: $(srcdir)/pscat.spad
	$(unpack_file) ")abbrev category PSCAT PowerSeriesCategory" < $< > $@

ULSCAT.spad: $(srcdir)/pscat.spad
	$(unpack_file) ")abbrev category ULSCAT UnivariateLaurentSeriesCategory" < $< > $@

UPSCAT.spad: $(srcdir)/pscat.spad
	$(unpack_file) ")abbrev category UPSCAT UnivariatePowerSeriesCategory" < $< > $@

UPXSCAT.spad: $(srcdir)/pscat.spad
	$(unpack_file) ")abbrev category UPXSCAT UnivariatePuiseuxSeriesCategory" < $< > $@

UTSCAT.spad: $(srcdir)/pscat.spad
	$(unpack_file) ")abbrev category UTSCAT UnivariateTaylorSeriesCategory" < $< > $@

PSEUDLIN.spad: $(srcdir)/pseudolin.spad
	$(unpack_file) ")abbrev package PSEUDLIN PseudoLinearNormalForm" < $< > $@

PTRANFN.spad: $(srcdir)/ptranfn.spad
	$(unpack_file) ")abbrev category PTRANFN PartialTranscendentalFunctions" < $< > $@

UPXSCCA.spad: $(srcdir)/puiseux.spad
	$(unpack_file) ")abbrev category UPXSCCA UnivariatePuiseuxSeriesConstructorCategory" < $< > $@

UPXSCONS.spad: $(srcdir)/puiseux.spad
	$(unpack_file) ")abbrev domain UPXSCONS UnivariatePuiseuxSeriesConstructor" < $< > $@

UPXS.spad: $(srcdir)/puiseux.spad
	$(unpack_file) ")abbrev domain UPXS UnivariatePuiseuxSeries" < $< > $@

UPXS2.spad: $(srcdir)/puiseux.spad
	$(unpack_file) ")abbrev package UPXS2 UnivariatePuiseuxSeriesFunctions2" < $< > $@

QALGSET.spad: $(srcdir)/qalgset.spad
	$(unpack_file) ")abbrev domain QALGSET QuasiAlgebraicSet" < $< > $@

QALGSET2.spad: $(srcdir)/qalgset.spad
	$(unpack_file) ")abbrev package QALGSET2 QuasiAlgebraicSet2" < $< > $@

QUATCAT.spad: $(srcdir)/quat.spad
	$(unpack_file) ")abbrev category QUATCAT QuaternionCategory" < $< > $@

QUAT2.spad: $(srcdir)/quat.spad
	$(unpack_file) ")abbrev domain QUAT2 GeneralQuaternion" < $< > $@

QUAT.spad: $(srcdir)/quat.spad
	$(unpack_file) ")abbrev domain QUAT Quaternion" < $< > $@

QUATCT2.spad: $(srcdir)/quat.spad
	$(unpack_file) ")abbrev package QUATCT2 QuaternionCategoryFunctions2" < $< > $@

REP.spad: $(srcdir)/radeigen.spad
	$(unpack_file) ")abbrev package REP RadicalEigenPackage" < $< > $@

BINARY.spad: $(srcdir)/radix.spad
	$(unpack_file) ")abbrev domain BINARY BinaryExpansion" < $< > $@

DECIMAL.spad: $(srcdir)/radix.spad
	$(unpack_file) ")abbrev domain DECIMAL DecimalExpansion" < $< > $@

HEXADEC.spad: $(srcdir)/radix.spad
	$(unpack_file) ")abbrev domain HEXADEC HexadecimalExpansion" < $< > $@

RADIX.spad: $(srcdir)/radix.spad
	$(unpack_file) ")abbrev domain RADIX RadixExpansion" < $< > $@

RADUTIL.spad: $(srcdir)/radix.spad
	$(unpack_file) ")abbrev package RADUTIL RadixUtilities" < $< > $@

INTBIT.spad: $(srcdir)/random.spad
	$(unpack_file) ")abbrev package INTBIT IntegerBits" < $< > $@

RANDSRC.spad: $(srcdir)/random.spad
	$(unpack_file) ")abbrev package RANDSRC RandomNumberSource" < $< > $@

RDIST.spad: $(srcdir)/random.spad
	$(unpack_file) ")abbrev package RDIST RandomDistributions" < $< > $@

RFDIST.spad: $(srcdir)/random.spad
	$(unpack_file) ")abbrev package RFDIST RandomFloatDistributions" < $< > $@

RIDIST.spad: $(srcdir)/random.spad
	$(unpack_file) ")abbrev package RIDIST RandomIntegerDistributions" < $< > $@

RATFACT.spad: $(srcdir)/ratfact.spad
	$(unpack_file) ")abbrev package RATFACT RationalFactorize" < $< > $@

ARRAY22.spad: $(srcdir)/rdeefx.spad
	$(unpack_file) ")abbrev package ARRAY22 TwoDimensionalArrayFunctions" < $< > $@

CLINDEP.spad: $(srcdir)/rdeefx.spad
	$(unpack_file) ")abbrev package CLINDEP ConstantLinearDependence" < $< > $@

FSRROOT.spad: $(srcdir)/rdeefx.spad
	$(unpack_file) ")abbrev package FSRROOT FunctionSpaceRationalRoots" < $< > $@

PRROOT.spad: $(srcdir)/rdeefx.spad
	$(unpack_file) ")abbrev package PRROOT PolynomialRationalRoots" < $< > $@

RDEEFX2.spad: $(srcdir)/rdeefx.spad
	$(unpack_file) ")abbrev package RDEEFX2 ElementaryRischDEX2" < $< > $@

RDEEFX.spad: $(srcdir)/rdeefx.spad
	$(unpack_file) ")abbrev package RDEEFX ElementaryRischDEX" < $< > $@

RDEEFS.spad: $(srcdir)/rdesys.spad
	$(unpack_file) ")abbrev package RDEEFS ElementaryRischDESystem" < $< > $@

RDETRS.spad: $(srcdir)/rdesys.spad
	$(unpack_file) ")abbrev package RDETRS TranscendentalRischDESystem" < $< > $@

REAL0Q.spad: $(srcdir)/real0q.spad
	$(unpack_file) ")abbrev package REAL0Q RealZeroPackageQ" < $< > $@

REAL0.spad: $(srcdir)/realzero.spad
	$(unpack_file) ")abbrev package REAL0 RealZeroPackage" < $< > $@

RCFIELD.spad: $(srcdir)/reclos.spad
	$(unpack_file) ")abbrev category RCFIELD RealClosedField" < $< > $@

RRCC.spad: $(srcdir)/reclos.spad
	$(unpack_file) ")abbrev category RRCC RealRootCharacterizationCategory" < $< > $@

RECLOS.spad: $(srcdir)/reclos.spad
	$(unpack_file) ")abbrev domain RECLOS RealClosure" < $< > $@

ROIRC.spad: $(srcdir)/reclos.spad
	$(unpack_file) ")abbrev domain ROIRC RightOpenIntervalRootCharacterization" < $< > $@

POLUTIL.spad: $(srcdir)/reclos.spad
	$(unpack_file) ")abbrev package POLUTIL RealPolynomialUtilitiesPackage" < $< > $@

RECOP.spad: $(srcdir)/rec.spad
	$(unpack_file) ")abbrev package RECOP RecurrenceOperator" < $< > $@

RSETCAT.spad: $(srcdir)/regset.spad
	$(unpack_file) ")abbrev category RSETCAT RegularTriangularSetCategory" < $< > $@

REGSET.spad: $(srcdir)/regset.spad
	$(unpack_file) ")abbrev domain REGSET RegularTriangularSet" < $< > $@

QCMPACK.spad: $(srcdir)/regset.spad
	$(unpack_file) ")abbrev package QCMPACK QuasiComponentPackage" < $< > $@

RSDCMPK.spad: $(srcdir)/regset.spad
	$(unpack_file) ")abbrev package RSDCMPK RegularSetDecompositionPackage" < $< > $@

RSETGCD.spad: $(srcdir)/regset.spad
	$(unpack_file) ")abbrev package RSETGCD RegularTriangularSetGcdPackage" < $< > $@

REP1.spad: $(srcdir)/rep1.spad
	$(unpack_file) ")abbrev package REP1 RepresentationPackage1" < $< > $@

REP2.spad: $(srcdir)/rep2.spad
	$(unpack_file) ")abbrev package REP2 RepresentationPackage2" < $< > $@

RESRING.spad: $(srcdir)/resring.spad
	$(unpack_file) ")abbrev domain RESRING ResidueRing" < $< > $@

FRETRCT.spad: $(srcdir)/retract.spad
	$(unpack_file) ")abbrev category FRETRCT FullyRetractableTo" < $< > $@

INTRET.spad: $(srcdir)/retract.spad
	$(unpack_file) ")abbrev package INTRET IntegerRetractions" < $< > $@

RATRET.spad: $(srcdir)/retract.spad
	$(unpack_file) ")abbrev package RATRET RationalRetractions" < $< > $@

POLYCATQ.spad: $(srcdir)/rf.spad
	$(unpack_file) ")abbrev package POLYCATQ PolynomialCategoryQuotientFunctions" < $< > $@

RF.spad: $(srcdir)/rf.spad
	$(unpack_file) ")abbrev package RF RationalFunction" < $< > $@

ODEPRRIC.spad: $(srcdir)/riccati.spad
	$(unpack_file) ")abbrev package ODEPRRIC PrimitiveRatRicDE" < $< > $@

ODERTRIC.spad: $(srcdir)/riccati.spad
	$(unpack_file) ")abbrev package ODERTRIC RationalRicDE" < $< > $@

RINTERP.spad: $(srcdir)/rinterp.spad
	$(unpack_file) ")abbrev package RINTERP RationalInterpolation" < $< > $@

RULE.spad: $(srcdir)/rule.spad
	$(unpack_file) ")abbrev domain RULE RewriteRule" < $< > $@

RULESET.spad: $(srcdir)/rule.spad
	$(unpack_file) ")abbrev domain RULESET Ruleset" < $< > $@

APPRULE.spad: $(srcdir)/rule.spad
	$(unpack_file) ")abbrev package APPRULE ApplyRules" < $< > $@

SPTCAT.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev category SPTCAT SPointCategory" < $< > $@

SARGND.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain SARGND SArgand" < $< > $@

SBOUND.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain SBOUND SBoundary" < $< > $@

SCENE.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain SCENE Scene" < $< > $@

SCIFS.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain SCIFS SceneIFS" < $< > $@

SCNP.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain SCNP SceneNamedPoints" < $< > $@

SCONF.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain SCONF SConformal" < $< > $@

SCRT.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain SCRT SCartesian" < $< > $@

STR.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain STR STransform" < $< > $@

XMLAT.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain XMLAT XmlAttribute" < $< > $@

XMLEL.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev domain XMLEL XmlElement" < $< > $@

XML.spad: $(srcdir)/scene.spad
	$(unpack_file) ")abbrev package XML ExportXml" < $< > $@

SEGCAT.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev category SEGCAT SegmentCategory" < $< > $@

SEGXCAT.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev category SEGXCAT SegmentExpansionCategory" < $< > $@

SEGBIND.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev domain SEGBIND SegmentBinding" < $< > $@

SEG.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev domain SEG Segment" < $< > $@

UNISEG.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev domain UNISEG UniversalSegment" < $< > $@

INCRMAPS.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev package INCRMAPS IncrementingMaps" < $< > $@

SEG2.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev package SEG2 SegmentFunctions2" < $< > $@

SEGBIND2.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev package SEGBIND2 SegmentBindingFunctions2" < $< > $@

UNISEG2.spad: $(srcdir)/seg.spad
	$(unpack_file) ")abbrev package UNISEG2 UniversalSegmentFunctions2" < $< > $@

TSEREXP.spad: $(srcdir)/serexp.spad
	$(unpack_file) ")abbrev category TSEREXP TaylorSeriesExpansion" < $< > $@

TSEREXPG.spad: $(srcdir)/serexp.spad
	$(unpack_file) ")abbrev package TSEREXPG TaylorSeriesExpansionGeneralized" < $< > $@

TSEREXPL.spad: $(srcdir)/serexp.spad
	$(unpack_file) ")abbrev package TSEREXPL TaylorSeriesExpansionLaurent" < $< > $@

TSEREXPP.spad: $(srcdir)/serexp.spad
	$(unpack_file) ")abbrev package TSEREXPP TaylorSeriesExpansionPuiseux" < $< > $@

TSEREXPT.spad: $(srcdir)/serexp.spad
	$(unpack_file) ")abbrev package TSEREXPT TaylorSeriesExpansionTaylor" < $< > $@

UDPO.spad: $(srcdir)/setorder.spad
	$(unpack_file) ")abbrev package UDPO UserDefinedPartialOrdering" < $< > $@

UDVO.spad: $(srcdir)/setorder.spad
	$(unpack_file) ")abbrev package UDVO UserDefinedVariableOrdering" < $< > $@

SET.spad: $(srcdir)/sets.spad
	$(unpack_file) ")abbrev domain SET Set" < $< > $@

SEXCAT.spad: $(srcdir)/sex.spad
	$(unpack_file) ")abbrev category SEXCAT SExpressionCategory" < $< > $@

SEXOF.spad: $(srcdir)/sex.spad
	$(unpack_file) ")abbrev domain SEXOF SExpressionOf" < $< > $@

SEX.spad: $(srcdir)/sex.spad
	$(unpack_file) ")abbrev domain SEX SExpression" < $< > $@

FPS.spad: $(srcdir)/sf.spad
	$(unpack_file) ")abbrev category FPS FloatingPointSystem" < $< > $@

REAL.spad: $(srcdir)/sf.spad
	$(unpack_file) ")abbrev category REAL RealConstant" < $< > $@

RNS.spad: $(srcdir)/sf.spad
	$(unpack_file) ")abbrev category RNS RealNumberSystem" < $< > $@

DFLOAT.spad: $(srcdir)/sf.spad
	$(unpack_file) ")abbrev domain DFLOAT DoubleFloat" < $< > $@

SGCF.spad: $(srcdir)/sgcf.spad
	$(unpack_file) ")abbrev package SGCF SymmetricGroupCombinatoricFunctions" < $< > $@

INPSIGN.spad: $(srcdir)/sign.spad
	$(unpack_file) ")abbrev package INPSIGN InnerPolySign" < $< > $@

LIMITRF.spad: $(srcdir)/sign.spad
	$(unpack_file) ")abbrev package LIMITRF RationalFunctionLimitPackage" < $< > $@

SIGNRF.spad: $(srcdir)/sign.spad
	$(unpack_file) ")abbrev package SIGNRF RationalFunctionSign" < $< > $@

TOOLSIGN.spad: $(srcdir)/sign.spad
	$(unpack_file) ")abbrev package TOOLSIGN ToolsForSign" < $< > $@

INS.spad: $(srcdir)/si.spad
	$(unpack_file) ")abbrev category INS IntegerNumberSystem" < $< > $@

SINT.spad: $(srcdir)/si.spad
	$(unpack_file) ")abbrev domain SINT SingleInteger" < $< > $@

MORECAT.spad: $(srcdir)/skpol.spad
	$(unpack_file) ")abbrev category MORECAT MultivariateSkewPolynomialCategory" < $< > $@

SSKPOLC.spad: $(srcdir)/skpol.spad
	$(unpack_file) ")abbrev category SSKPOLC SolvableSkewPolynomialCategory" < $< > $@

PDO.spad: $(srcdir)/skpol.spad
	$(unpack_file) ")abbrev domain PDO PartialDifferentialOperator" < $< > $@

SKSMP.spad: $(srcdir)/skpol.spad
	$(unpack_file) ")abbrev domain SKSMP SparseMultivariateSkewPolynomial" < $< > $@

NGROEB.spad: $(srcdir)/skpol.spad
	$(unpack_file) ")abbrev package NGROEB NGroebnerPackage" < $< > $@

OREMAT.spad: $(srcdir)/skpol.spad
	$(unpack_file) ")abbrev package OREMAT OrePolynomialMatrixOperations" < $< > $@

PDOHLP.spad: $(srcdir)/skpol.spad
	$(unpack_file) ")abbrev package PDOHLP PartialDifferentialOperatorHelper" < $< > $@

ISMITH.spad: $(srcdir)/smith2.spad
	$(unpack_file) ")abbrev package ISMITH IntegerSmithNormalForm" < $< > $@

UGAUSS.spad: $(srcdir)/smith2.spad
	$(unpack_file) ")abbrev package UGAUSS UnitGaussianElimination" < $< > $@

SMITH.spad: $(srcdir)/smith.spad
	$(unpack_file) ")abbrev package SMITH SmithNormalForm" < $< > $@

DIOSP.spad: $(srcdir)/solvedio.spad
	$(unpack_file) ")abbrev package DIOSP DiophantineSolutionPackage" < $< > $@

SOLVEFOR.spad: $(srcdir)/solvefor.spad
	$(unpack_file) ")abbrev package SOLVEFOR PolynomialSolveByFormulas" < $< > $@

LSMP1.spad: $(srcdir)/solvelin.spad
	$(unpack_file) ")abbrev package LSMP1 LinearSystemMatrixPackage1" < $< > $@

LSMP.spad: $(srcdir)/solvelin.spad
	$(unpack_file) ")abbrev package LSMP LinearSystemMatrixPackage" < $< > $@

LSPP.spad: $(srcdir)/solvelin.spad
	$(unpack_file) ")abbrev package LSPP LinearSystemPolynomialPackage" < $< > $@

DEGRED.spad: $(srcdir)/solverad.spad
	$(unpack_file) ")abbrev package DEGRED DegreeReductionPackage" < $< > $@

SOLVERAD.spad: $(srcdir)/solverad.spad
	$(unpack_file) ")abbrev package SOLVERAD RadicalSolvePackage" < $< > $@

SORTPAK.spad: $(srcdir)/sortpak.spad
	$(unpack_file) ")abbrev package SORTPAK SortPackage" < $< > $@

SPACEC.spad: $(srcdir)/space.spad
	$(unpack_file) ")abbrev category SPACEC ThreeSpaceCategory" < $< > $@

SPACE3.spad: $(srcdir)/space.spad
	$(unpack_file) ")abbrev domain SPACE3 ThreeSpace" < $< > $@

TOPSP.spad: $(srcdir)/space.spad
	$(unpack_file) ")abbrev package TOPSP TopLevelThreeSpace" < $< > $@

DFSFUN2.spad: $(srcdir)/special2.spad
	$(unpack_file) ")abbrev package DFSFUN2 DoubleFloatSpecialFunctions2" < $< > $@

ELIPIDF.spad: $(srcdir)/special2.spad
	$(unpack_file) ")abbrev package ELIPIDF DoubleFloatEllipticIntegrals" < $< > $@

FELFUN.spad: $(srcdir)/special2.spad
	$(unpack_file) ")abbrev package FELFUN FloatEllipticFunctions" < $< > $@

FLIOUFUN.spad: $(srcdir)/special2.spad
	$(unpack_file) ")abbrev package FLIOUFUN FloatLiouvilianFunctions" < $< > $@

FSFUN.spad: $(srcdir)/special2.spad
	$(unpack_file) ")abbrev package FSFUN FloatSpecialFunctions" < $< > $@

SPFUTS.spad: $(srcdir)/special2.spad
	$(unpack_file) ")abbrev package SPFUTS SpecialFunctionUnivariateTaylorSeries" < $< > $@

DFSFUN.spad: $(srcdir)/special.spad
	$(unpack_file) ")abbrev package DFSFUN DoubleFloatSpecialFunctions" < $< > $@

NTPOLFN.spad: $(srcdir)/special.spad
	$(unpack_file) ")abbrev package NTPOLFN NumberTheoreticPolynomialFunctions" < $< > $@

ORTHPOL.spad: $(srcdir)/special.spad
	$(unpack_file) ")abbrev package ORTHPOL OrthogonalPolynomialFunctions" < $< > $@

SFRTCAT.spad: $(srcdir)/sregset.spad
	$(unpack_file) ")abbrev category SFRTCAT SquareFreeRegularTriangularSetCategory" < $< > $@

SREGSET.spad: $(srcdir)/sregset.spad
	$(unpack_file) ")abbrev domain SREGSET SquareFreeRegularTriangularSet" < $< > $@

SFQCMPK.spad: $(srcdir)/sregset.spad
	$(unpack_file) ")abbrev package SFQCMPK SquareFreeQuasiComponentPackage" < $< > $@

SFRGCD.spad: $(srcdir)/sregset.spad
	$(unpack_file) ")abbrev package SFRGCD SquareFreeRegularTriangularSetGcdPackage" < $< > $@

SRDCMPK.spad: $(srcdir)/sregset.spad
	$(unpack_file) ")abbrev package SRDCMPK SquareFreeRegularSetDecompositionPackage" < $< > $@

SMPEXPR.spad: $(srcdir)/ssolve.spad
	$(unpack_file) ")abbrev domain SMPEXPR SparseMultivariatePolynomialExpressions" < $< > $@

EXPRSOL.spad: $(srcdir)/ssolve.spad
	$(unpack_file) ")abbrev package EXPRSOL ExpressionSolve" < $< > $@

UTSSOL.spad: $(srcdir)/ssolve.spad
	$(unpack_file) ")abbrev package UTSSOL TaylorSolve" < $< > $@

LZSTAGG.spad: $(srcdir)/stream.spad
	$(unpack_file) ")abbrev category LZSTAGG LazyStreamAggregate" < $< > $@

STREAM.spad: $(srcdir)/stream.spad
	$(unpack_file) ")abbrev domain STREAM Stream" < $< > $@

CSTTOOLS.spad: $(srcdir)/stream.spad
	$(unpack_file) ")abbrev package CSTTOOLS CyclicStreamTools" < $< > $@

STREAM1.spad: $(srcdir)/stream.spad
	$(unpack_file) ")abbrev package STREAM1 StreamFunctions1" < $< > $@

STREAM2.spad: $(srcdir)/stream.spad
	$(unpack_file) ")abbrev package STREAM2 StreamFunctions2" < $< > $@

STREAM3.spad: $(srcdir)/stream.spad
	$(unpack_file) ")abbrev package STREAM3 StreamFunctions3" < $< > $@

STRICAT.spad: $(srcdir)/string.spad
	$(unpack_file) ")abbrev category STRICAT StringCategory" < $< > $@

CCLASS.spad: $(srcdir)/string.spad
	$(unpack_file) ")abbrev domain CCLASS CharacterClass" < $< > $@

CHAR.spad: $(srcdir)/string.spad
	$(unpack_file) ")abbrev domain CHAR Character" < $< > $@

ISTRING.spad: $(srcdir)/string.spad
	$(unpack_file) ")abbrev domain ISTRING IndexedString" < $< > $@

STRING.spad: $(srcdir)/string.spad
	$(unpack_file) ")abbrev domain STRING String" < $< > $@

STTAYLOR.spad: $(srcdir)/sttaylor.spad
	$(unpack_file) ")abbrev package STTAYLOR StreamTaylorSeriesOperations" < $< > $@

STTFNC.spad: $(srcdir)/sttf.spad
	$(unpack_file) ")abbrev package STTFNC StreamTranscendentalFunctionsNonCommutative" < $< > $@

STTF.spad: $(srcdir)/sttf.spad
	$(unpack_file) ")abbrev package STTF StreamTranscendentalFunctions" < $< > $@

SHP.spad: $(srcdir)/sturm.spad
	$(unpack_file) ")abbrev package SHP SturmHabichtPackage" < $< > $@

SUCH.spad: $(srcdir)/suchthat.spad
	$(unpack_file) ")abbrev domain SUCH SuchThat" < $< > $@

GOSPER.spad: $(srcdir)/sum.spad
	$(unpack_file) ")abbrev package GOSPER GosperSummationMethod" < $< > $@

ISUMP.spad: $(srcdir)/sum.spad
	$(unpack_file) ")abbrev package ISUMP InnerPolySum" < $< > $@

SUMRF.spad: $(srcdir)/sum.spad
	$(unpack_file) ")abbrev package SUMRF RationalFunctionSum" < $< > $@

ISUPS.spad: $(srcdir)/sups.spad
	$(unpack_file) ")abbrev domain ISUPS InnerSparseUnivariatePowerSeries" < $< > $@

SULS.spad: $(srcdir)/sups.spad
	$(unpack_file) ")abbrev domain SULS SparseUnivariateLaurentSeries" < $< > $@

SUPXS.spad: $(srcdir)/sups.spad
	$(unpack_file) ")abbrev domain SUPXS SparseUnivariatePuiseuxSeries" < $< > $@

SUTS.spad: $(srcdir)/sups.spad
	$(unpack_file) ")abbrev domain SUTS SparseUnivariateTaylorSeries" < $< > $@

SYMBOL.spad: $(srcdir)/symbol.spad
	$(unpack_file) ")abbrev domain SYMBOL Symbol" < $< > $@

SYSSOLP.spad: $(srcdir)/syssolp.spad
	$(unpack_file) ")abbrev package SYSSOLP SystemSolvePackage" < $< > $@

MSYSCMD.spad: $(srcdir)/system.spad
	$(unpack_file) ")abbrev package MSYSCMD MoreSystemCommands" < $< > $@

TABLEAU.spad: $(srcdir)/tableau.spad
	$(unpack_file) ")abbrev domain TABLEAU Tableau" < $< > $@

TABLBUMP.spad: $(srcdir)/tableau.spad
	$(unpack_file) ")abbrev package TABLBUMP TableauxBumpers" < $< > $@

EQTBL.spad: $(srcdir)/table.spad
	$(unpack_file) ")abbrev domain EQTBL EqTable" < $< > $@

GSTBL.spad: $(srcdir)/table.spad
	$(unpack_file) ")abbrev domain GSTBL GeneralSparseTable" < $< > $@

HASHTBL.spad: $(srcdir)/table.spad
	$(unpack_file) ")abbrev domain HASHTBL HashTable" < $< > $@

INTABL.spad: $(srcdir)/table.spad
	$(unpack_file) ")abbrev domain INTABL InnerTable" < $< > $@

STBL.spad: $(srcdir)/table.spad
	$(unpack_file) ")abbrev domain STBL SparseTable" < $< > $@

STRTBL.spad: $(srcdir)/table.spad
	$(unpack_file) ")abbrev domain STRTBL StringTable" < $< > $@

TABLE.spad: $(srcdir)/table.spad
	$(unpack_file) ")abbrev domain TABLE Table" < $< > $@

ITAYLOR.spad: $(srcdir)/taylor.spad
	$(unpack_file) ")abbrev domain ITAYLOR InnerTaylorSeries" < $< > $@

UTS.spad: $(srcdir)/taylor.spad
	$(unpack_file) ")abbrev domain UTS UnivariateTaylorSeries" < $< > $@

INFPROD0.spad: $(srcdir)/taylor.spad
	$(unpack_file) ")abbrev package INFPROD0 InfiniteLambertProduct" < $< > $@

UTS2.spad: $(srcdir)/taylor.spad
	$(unpack_file) ")abbrev package UTS2 UnivariateTaylorSeriesFunctions2" < $< > $@

BIALG.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev category BIALG Bialgebra" < $< > $@

COALG.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev category COALG Coalgebra" < $< > $@

HOPFALG.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev category HOPFALG HopfAlgebra" < $< > $@

TENSCAT.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev category TENSCAT TensorProductCategory" < $< > $@

TENSPC.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev category TENSPC TensorPowerCategory" < $< > $@

TENSPRP.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev category TENSPRP TensorProductProperty" < $< > $@

TENSOR.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev domain TENSOR TensorProduct" < $< > $@

TENSPOW.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev domain TENSPOW TensorPower" < $< > $@

TENSPO2.spad: $(srcdir)/tensor.spad
	$(unpack_file) ")abbrev package TENSPO2 TensorPowerFunctions2" < $< > $@

TMFORM.spad: $(srcdir)/texmacs.spad
	$(unpack_file) ")abbrev domain TMFORM TexmacsFormat" < $< > $@

TEX.spad: $(srcdir)/tex.spad
	$(unpack_file) ")abbrev domain TEX TexFormat" < $< > $@

TEX1.spad: $(srcdir)/tex.spad
	$(unpack_file) ")abbrev package TEX1 TexFormat1" < $< > $@

SOLVESER.spad: $(srcdir)/transsolve.spad
	$(unpack_file) ")abbrev package SOLVESER TransSolvePackageService" < $< > $@

SOLVETRA.spad: $(srcdir)/transsolve.spad
	$(unpack_file) ")abbrev package SOLVETRA TransSolvePackage" < $< > $@

BTCAT.spad: $(srcdir)/tree.spad
	$(unpack_file) ")abbrev category BTCAT BinaryTreeCategory" < $< > $@

BBTREE.spad: $(srcdir)/tree.spad
	$(unpack_file) ")abbrev domain BBTREE BalancedBinaryTree" < $< > $@

BSTREE.spad: $(srcdir)/tree.spad
	$(unpack_file) ")abbrev domain BSTREE BinarySearchTree" < $< > $@

BTOURN.spad: $(srcdir)/tree.spad
	$(unpack_file) ")abbrev domain BTOURN BinaryTournament" < $< > $@

BTREE.spad: $(srcdir)/tree.spad
	$(unpack_file) ")abbrev domain BTREE BinaryTree" < $< > $@

PENDTREE.spad: $(srcdir)/tree.spad
	$(unpack_file) ")abbrev domain PENDTREE PendantTree" < $< > $@

TREE.spad: $(srcdir)/tree.spad
	$(unpack_file) ")abbrev domain TREE Tree" < $< > $@

AHYP.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category AHYP ArcHyperbolicFunctionCategory" < $< > $@

ATRIG.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category ATRIG ArcTrigonometricFunctionCategory" < $< > $@

CFCAT.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category CFCAT CombinatorialFunctionCategory" < $< > $@

ELEMFUN.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category ELEMFUN ElementaryFunctionCategory" < $< > $@

HYPCAT.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category HYPCAT HyperbolicFunctionCategory" < $< > $@

LFCAT.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category LFCAT LiouvillianFunctionCategory" < $< > $@

PRIMCAT.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category PRIMCAT PrimitiveFunctionCategory" < $< > $@

RADCAT.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category RADCAT RadicalCategory" < $< > $@

SPFCAT.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category SPFCAT SpecialFunctionCategory" < $< > $@

TRANFUN.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category TRANFUN TranscendentalFunctionCategory" < $< > $@

TRIGCAT.spad: $(srcdir)/trigcat.spad
	$(unpack_file) ")abbrev category TRIGCAT TrigonometricFunctionCategory" < $< > $@

TSETCAT.spad: $(srcdir)/triset.spad
	$(unpack_file) ")abbrev category TSETCAT TriangularSetCategory" < $< > $@

GTSET.spad: $(srcdir)/triset.spad
	$(unpack_file) ")abbrev domain GTSET GeneralTriangularSet" < $< > $@

WUTSET.spad: $(srcdir)/triset.spad
	$(unpack_file) ")abbrev domain WUTSET WuWenTsunTriangularSet" < $< > $@

PSETPK.spad: $(srcdir)/triset.spad
	$(unpack_file) ")abbrev package PSETPK PolynomialSetUtilitiesPackage" < $< > $@

TUBE.spad: $(srcdir)/tube.spad
	$(unpack_file) ")abbrev domain TUBE TubePlot" < $< > $@

EXPRTUBE.spad: $(srcdir)/tube.spad
	$(unpack_file) ")abbrev package EXPRTUBE ExpressionTubePlot" < $< > $@

NUMTUBE.spad: $(srcdir)/tube.spad
	$(unpack_file) ")abbrev package NUMTUBE NumericTubePlot" < $< > $@

TUBETOOL.spad: $(srcdir)/tube.spad
	$(unpack_file) ")abbrev package TUBETOOL TubePlotTools" < $< > $@

NORMRETR.spad: $(srcdir)/twofact.spad
	$(unpack_file) ")abbrev package NORMRETR NormRetractPackage" < $< > $@

TWOFACT.spad: $(srcdir)/twofact.spad
	$(unpack_file) ")abbrev package TWOFACT TwoFactorize" < $< > $@

U16MAT.spad: $(srcdir)/u32vec.spad
	$(unpack_file) ")abbrev domain U16MAT U16Matrix" < $< > $@

U16VEC.spad: $(srcdir)/u32vec.spad
	$(unpack_file) ")abbrev domain U16VEC U16Vector" < $< > $@

U32MAT.spad: $(srcdir)/u32vec.spad
	$(unpack_file) ")abbrev domain U32MAT U32Matrix" < $< > $@

U32VEC.spad: $(srcdir)/u32vec.spad
	$(unpack_file) ")abbrev domain U32VEC U32Vector" < $< > $@

U8MAT.spad: $(srcdir)/u32vec.spad
	$(unpack_file) ")abbrev domain U8MAT U8Matrix" < $< > $@

U8VEC.spad: $(srcdir)/u32vec.spad
	$(unpack_file) ")abbrev domain U8VEC U8Vector" < $< > $@

POLYVEC.spad: $(srcdir)/u32vec.spad
	$(unpack_file) ")abbrev package POLYVEC U32VectorPolynomialOperations" < $< > $@

TESTAUX.spad: $(srcdir)/unittest.spad
	$(unpack_file) ")abbrev package TESTAUX UnittestAux" < $< > $@

TESTCNT.spad: $(srcdir)/unittest.spad
	$(unpack_file) ")abbrev package TESTCNT UnittestCount" < $< > $@

TESTUNIT.spad: $(srcdir)/unittest.spad
	$(unpack_file) ")abbrev package TESTUNIT Unittest" < $< > $@

UPDECOMP.spad: $(srcdir)/updecomp.spad
	$(unpack_file) ")abbrev package UPDECOMP UnivariatePolynomialDecompositionPackage" < $< > $@

UPDIVP.spad: $(srcdir)/updecomp.spad
	$(unpack_file) ")abbrev package UPDIVP UnivariatePolynomialDivisionPackage" < $< > $@

UTSODE.spad: $(srcdir)/utsode.spad
	$(unpack_file) ")abbrev package UTSODE UnivariateTaylorSeriesODESolver" < $< > $@

ANON.spad: $(srcdir)/variable.spad
	$(unpack_file) ")abbrev domain ANON AnonymousFunction" < $< > $@

FUNCTION.spad: $(srcdir)/variable.spad
	$(unpack_file) ")abbrev domain FUNCTION FunctionCalled" < $< > $@

OVAR.spad: $(srcdir)/variable.spad
	$(unpack_file) ")abbrev domain OVAR OrderedVariableList" < $< > $@

RULECOLD.spad: $(srcdir)/variable.spad
	$(unpack_file) ")abbrev domain RULECOLD RuleCalled" < $< > $@

VARIABLE.spad: $(srcdir)/variable.spad
	$(unpack_file) ")abbrev domain VARIABLE Variable" < $< > $@

SOREXPV.spad: $(srcdir)/vecrec.spad
	$(unpack_file) ")abbrev domain SOREXPV SortedExponentVector" < $< > $@

VECREC1.spad: $(srcdir)/vecrec.spad
	$(unpack_file) ")abbrev domain VECREC1 VectorModularReconstructor" < $< > $@

VECREC2.spad: $(srcdir)/vecrec.spad
	$(unpack_file) ")abbrev domain VECREC2 VectorIntegerReconstructor" < $< > $@

DIRPCAT.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev category DIRPCAT DirectProductCategory" < $< > $@

VECTCAT.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev category VECTCAT VectorCategory" < $< > $@

DIRPROD.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev domain DIRPROD DirectProduct" < $< > $@

DPMM.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev domain DPMM DirectProductMatrixModule" < $< > $@

DPMO.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev domain DPMO DirectProductModule" < $< > $@

IVECTOR.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev domain IVECTOR IndexedVector" < $< > $@

VECTOR.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev domain VECTOR Vector" < $< > $@

DIRPROD2.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev package DIRPROD2 DirectProductFunctions2" < $< > $@

VECTOR2.spad: $(srcdir)/vector.spad
	$(unpack_file) ")abbrev package VECTOR2 VectorFunctions2" < $< > $@

GRIMAGE.spad: $(srcdir)/view2D.spad
	$(unpack_file) ")abbrev domain GRIMAGE GraphImage" < $< > $@

VIEW2D.spad: $(srcdir)/view2D.spad
	$(unpack_file) ")abbrev domain VIEW2D TwoDimensionalViewport" < $< > $@

VIEW3D.spad: $(srcdir)/view3D.spad
	$(unpack_file) ")abbrev domain VIEW3D ThreeDimensionalViewport" < $< > $@

VIEWDEF.spad: $(srcdir)/viewDef.spad
	$(unpack_file) ")abbrev package VIEWDEF ViewDefaultsPackage" < $< > $@

VIEW.spad: $(srcdir)/viewpack.spad
	$(unpack_file) ")abbrev package VIEW ViewportPackage" < $< > $@

VSBASIS.spad: $(srcdir)/vsbasis.spad
	$(unpack_file) ")abbrev domain VSBASIS VectorSpaceBasis" < $< > $@

WEIER.spad: $(srcdir)/weier.spad
	$(unpack_file) ")abbrev package WEIER WeierstrassPreparation" < $< > $@

OWP.spad: $(srcdir)/wtpol.spad
	$(unpack_file) ")abbrev domain OWP OrdinaryWeightedPolynomials" < $< > $@

WP.spad: $(srcdir)/wtpol.spad
	$(unpack_file) ")abbrev domain WP WeightedPolynomials" < $< > $@

XHASHTBL.spad: $(srcdir)/xhash.spad
	$(unpack_file) ")abbrev domain XHASHTBL XHashTable" < $< > $@

FLALG.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev category FLALG FreeLieAlgebra" < $< > $@

LIECAT.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev category LIECAT LieAlgebra" < $< > $@

FMAGMA.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev domain FMAGMA FreeMagma" < $< > $@

LEXP.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev domain LEXP LieExponentials" < $< > $@

LPOLY.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev domain LPOLY LiePolynomial" < $< > $@

LWORD.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev domain LWORD LyndonWord" < $< > $@

PBWLB.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev domain PBWLB PoincareBirkhoffWittLyndonBasis" < $< > $@

XPBWPOLY.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev domain XPBWPOLY XPBWPolynomial" < $< > $@

XEXPPKG.spad: $(srcdir)/xlpoly.spad
	$(unpack_file) ")abbrev package XEXPPKG XExponentialPackage" < $< > $@

XALG.spad: $(srcdir)/xpoly.spad
	$(unpack_file) ")abbrev category XALG XAlgebra" < $< > $@

XFALG.spad: $(srcdir)/xpoly.spad
	$(unpack_file) ")abbrev category XFALG XFreeAlgebra" < $< > $@

XPOLYC.spad: $(srcdir)/xpoly.spad
	$(unpack_file) ")abbrev category XPOLYC XPolynomialsCat" < $< > $@

XDPOLY.spad: $(srcdir)/xpoly.spad
	$(unpack_file) ")abbrev domain XDPOLY XDistributedPolynomial" < $< > $@

XPOLY.spad: $(srcdir)/xpoly.spad
	$(unpack_file) ")abbrev domain XPOLY XPolynomial" < $< > $@

XPR.spad: $(srcdir)/xpoly.spad
	$(unpack_file) ")abbrev domain XPR XPolynomialRing" < $< > $@

XRPOLY.spad: $(srcdir)/xpoly.spad
	$(unpack_file) ")abbrev domain XRPOLY XRecursivePolynomial" < $< > $@

YSTREAM.spad: $(srcdir)/ystream.spad
	$(unpack_file) ")abbrev package YSTREAM ParadoxicalCombinatorsForStreams" < $< > $@

RGCHAIN.spad: $(srcdir)/zerodim.spad
	$(unpack_file) ")abbrev domain RGCHAIN RegularChain" < $< > $@

FGLMICPK.spad: $(srcdir)/zerodim.spad
	$(unpack_file) ")abbrev package FGLMICPK FGLMIfCanPackage" < $< > $@

IRURPK.spad: $(srcdir)/zerodim.spad
	$(unpack_file) ")abbrev package IRURPK InternalRationalUnivariateRepresentationPackage" < $< > $@

LEXTRIPK.spad: $(srcdir)/zerodim.spad
	$(unpack_file) ")abbrev package LEXTRIPK LexTriangularPackage" < $< > $@

RURPK.spad: $(srcdir)/zerodim.spad
	$(unpack_file) ")abbrev package RURPK RationalUnivariateRepresentationPackage" < $< > $@

ZDSOLVE.spad: $(srcdir)/zerodim.spad
	$(unpack_file) ")abbrev package ZDSOLVE ZeroDimensionalSolvePackage" < $< > $@

