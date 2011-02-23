package asmock.framework.impl
{
	import asmock.framework.MockRepository;
	import asmock.framework.expectations.IExpectation;

	[ExcludeClass]	
	public interface IRecordMockState extends IMockState
	{
		function get lastExpectation() : IExpectation;
		function set lastExpectation(value : IExpectation) : void;
		
		function get repository() : MockRepository;
		function get proxy() : Object;
	}
}