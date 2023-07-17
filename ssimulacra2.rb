class Ssimulacra2 < Formula
  desc "tool for checking image similarity"
  homepage "https://github.com/cloudinary/ssimulacra2"
  url "https://github.com/cloudinary/ssimulacra2/archive/v2.1.tar.gz"
  sha256 "70eedc00b7f6a006d93c82dc10c72484e2bda91ed455f785e7fa7a3192a9e6d6"

  depends_on "cmake"
  depends_on "ninja"
  depends_on "little-cms2"
  depends_on "libpng"
  depends_on "libjpeg-turbo"
  depends_on "highway"

  def install
    mkdir "build" do
      system "cmake", "../src", "-G", "ninja"
      system "ninja", "ssimulacra2"
      system "strip", "ssimulacra2"
      bin.install "ssimulacra2"
    end
  end

  test do
    system "true"
  end
end
