{ ... }:
{	

	# fixing hibernation
	boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

	hardware.nvidia.powerManagement.enable = true;

	hardware.nvidia.open = false;

} 
