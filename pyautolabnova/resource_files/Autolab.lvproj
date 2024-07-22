<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="12008004">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="SubVI" Type="Folder">
			<Item Name="Sampler.vi" Type="VI" URL="../Sampler.vi"/>
			<Item Name="Release.vi" Type="VI" URL="../Release.vi"/>
			<Item Name="Connect.vi" Type="VI" URL="../Connect.vi"/>
			<Item Name="FRA.vi" Type="VI" URL="../FRA.vi"/>
			<Item Name="Measure Procedure.vi" Type="VI" URL="../Measure Procedure.vi"/>
			<Item Name="Path.vi" Type="VI" URL="../Path.vi"/>
			<Item Name="Load Procedure.vi" Type="VI" URL="../Load Procedure.vi"/>
		</Item>
		<Item Name="Advanced SubVI" Type="Folder">
			<Item Name="ADC (A).vi" Type="VI" URL="../ADC (A).vi"/>
			<Item Name="DAC (A).vi" Type="VI" URL="../DAC (A).vi"/>
			<Item Name="DIO (A).vi" Type="VI" URL="../DIO (A).vi"/>
			<Item Name="EI (A).vi" Type="VI" URL="../EI (A).vi"/>
			<Item Name="Procedure Parameters (A).vi" Type="VI" URL="../Procedure Parameters (A).vi"/>
			<Item Name="Sampler Signals (A).vi" Type="VI" URL="../Sampler Signals (A).vi"/>
			<Item Name="Measured Data (A).vi" Type="VI" URL="../Measured Data (A).vi"/>
		</Item>
		<Item Name="Basic SubVI" Type="Folder">
			<Item Name="ADC (B).vi" Type="VI" URL="../ADC (B).vi"/>
			<Item Name="DAC (B).vi" Type="VI" URL="../DAC (B).vi"/>
			<Item Name="DIO (B).vi" Type="VI" URL="../DIO (B).vi"/>
			<Item Name="EI (B).vi" Type="VI" URL="../EI (B).vi"/>
			<Item Name="Procedure Parameters (B).vi" Type="VI" URL="../Procedure Parameters (B).vi"/>
			<Item Name="Sampler Signals (B).vi" Type="VI" URL="../Sampler Signals (B).vi"/>
			<Item Name="Measured Data (B).vi" Type="VI" URL="../Measured Data (B).vi"/>
		</Item>
		<Item Name="Advanced Examples" Type="Folder">
			<Item Name="ADC Example (A).vi" Type="VI" URL="../ADC Example (A).vi"/>
			<Item Name="DAC Example (A).vi" Type="VI" URL="../DAC Example (A).vi"/>
			<Item Name="DIO Example (A).vi" Type="VI" URL="../DIO Example (A).vi"/>
			<Item Name="EI Example (A).vi" Type="VI" URL="../EI Example (A).vi"/>
			<Item Name="FRA example (A).vi" Type="VI" URL="../FRA example (A).vi"/>
			<Item Name="Procedure Parameters Example (A).vi" Type="VI" URL="../Procedure Parameters Example (A).vi"/>
			<Item Name="Measuring Example (A).vi" Type="VI" URL="../Measuring Example (A).vi"/>
			<Item Name="Sampler Example.vi" Type="VI" URL="../Sampler Example.vi"/>
			<Item Name="Measured Data Example (A).vi" Type="VI" URL="../Measured Data Example (A).vi"/>
			<Item Name="Measuring Complete Example (A).vi" Type="VI" URL="../Measuring Complete Example (A).vi"/>
			<Item Name="Autolab Complete Example (A).vi" Type="VI" URL="../Autolab Complete Example (A).vi"/>
			<Item Name="[TN#5] FRA example (A).vi" Type="VI" URL="../[TN#5] FRA example (A).vi"/>
			<Item Name="[TN#5] Measuring Complete Example(A).vi" Type="VI" URL="../[TN#5] Measuring Complete Example(A).vi"/>
		</Item>
		<Item Name="Basic Examples" Type="Folder">
			<Item Name="ADC Example (B).vi" Type="VI" URL="../ADC Example (B).vi"/>
			<Item Name="DAC Example (B).vi" Type="VI" URL="../DAC Example (B).vi"/>
			<Item Name="DIO Example (B).vi" Type="VI" URL="../DIO Example (B).vi"/>
			<Item Name="EI Example (B).vi" Type="VI" URL="../EI Example (B).vi"/>
			<Item Name="Measuring Example (B).vi" Type="VI" URL="../Measuring Example (B).vi"/>
			<Item Name="Measuring Complete Example (B).vi" Type="VI" URL="../Measuring Complete Example (B).vi"/>
			<Item Name="Measured Data Example (B).vi" Type="VI" URL="../Measured Data Example (B).vi"/>
			<Item Name="Procedure Parameters Example (B).vi" Type="VI" URL="../Procedure Parameters Example (B).vi"/>
			<Item Name="Autolab Complete Example (B).vi" Type="VI" URL="../Autolab Complete Example (B).vi"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="subTimeDelay.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/TimeDelayBlock.llb/subTimeDelay.vi"/>
				<Item Name="subBuildXYGraph.vi" Type="VI" URL="/&lt;vilib&gt;/express/express controls/BuildXYGraphBlock.llb/subBuildXYGraph.vi"/>
				<Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
			</Item>
			<Item Name="mscorlib" Type="VI" URL="mscorlib">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="EcoChemie.Autolab.Sdk.dll" Type="Document" URL="../EcoChemie.Autolab.Sdk.dll"/>
			<Item Name="EcoChemie100.dll" Type="Document" URL="../EcoChemie100.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
