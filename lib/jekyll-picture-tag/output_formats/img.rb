module PictureTag
  module OutputFormats
    # Represents a bare <img> tag with a srcset attribute.
    # Used when <picture> is unnecessary.
    class Img
      include PictureTag::OutputFormats::Basics
      def initialize(instructions)
        super(instructions)
      end

      def srcset
        build_srcset(nil, @instructions.preset['formats'].first)
      end

      def to_s
        img = build_base_img(srcset)
        img.sizes = srcset.sizes if srcset.sizes

        img.to_s
      end
    end
  end
end
