FROM centos:6

# install dependencies
RUN yum install -y yum-utils

# install mono dependencies
RUN rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
RUN rpm --import "https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6"
RUN yum-config-manager --add-repo http://download.mono-project.com/repo/centos6/
RUN yum-config-manager --add-repo http://mindtouch-yum-public.s3.amazonaws.com/mt-prince/
RUN yum-config-manager --add-repo https://dl.fedoraproject.org/pub/epel/6/x86_64/

# install mono
RUN yum install -y mono-core-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-mvc-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-data-5.2.0.224-0.xamarin.1.epel6.x86_64  mono-data-oracle-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-data-sqlite-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-winfxcore-5.2.0.224-0.xamarin.1.epel6.x86_64 libmonosgen-2_0-1-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-winforms-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-web-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-extras-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-devel-5.2.0.224-0.xamarin.1.epel6.x86_64 mono-wcf-5.2.0.224-0.xamarin.1.epel6.x86_64 msbuild-15.3+xamarinxplat.2017.07.20.13.52-0.xamarin.7.epel7.noarch NUnit
RUN yum install -y --nogpgcheck prince
RUN yum install -y python-pip
RUN yum clean all
RUN pip install awscli

# volumes
VOLUME "/mindtouch/solid-doodle"
