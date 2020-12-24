class Mozjpegoptim < Formula
  desc "jpegoptim compiled with mozjpeg for better quality"
  homepage "https://github.com/tjko/jpegoptim"
  url "https://github.com/tjko/jpegoptim/archive/RELEASE.1.4.6.tar.gz"
  sha256 "c44dcfac0a113c3bec13d0fc60faf57a0f9a31f88473ccad33ecdf210b4c0c52"
  
  conflicts_with "jpegoptim", :because => "jpegoptim also has a jpegoptim binary"

  depends_on "mozjpeg"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "CPPFLAGS=-I/usr/local/opt/mozjpeg/include",
                          "LDFLAGS=-L/usr/local/opt/mozjpeg/lib",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
    system "make install" # if this fails, try separate make/make install steps
    mv "#{bin}/jpegoptim", "#{bin}/mozjpegoptim"
  end

  test do
    system "true"
  end
end
